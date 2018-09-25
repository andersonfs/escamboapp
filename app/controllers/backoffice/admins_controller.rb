# frozen_string_literal: true

class Backoffice::AdminsController < BackofficeController
  before_action :set_admin, only: %i[edit update destroy]
  # Pundit - Garante que colocamos a verificação. Se não colocar, um erro é lançado.
  after_action :verify_authorized, only: [:new, :destroy]
  after_action :verify_policy_scoped, only: :index

  def index
    @admins = policy_scope(Admin)
    # @admins = Admin.all
    # With scope
    # @admins = Admin.with_full_access
    # @admins = Admin.with_restricted_access
  end

  def new
    @admin = Admin.new
    authorize @admin
  end

  def create
    @admin = Admin.new(params_admin)
    update_roles
    if @admin.save
      redirect_to backoffice_admins_path, notice: "O Administrador (#{@admin.name}) foi cadastrado com suceso! "
    else
      render :new
    end
  end

  def edit; end

  def update
    update_roles
    if @admin.update(params_admin)
      AdminMailer.update_email(current_admin, @admin).deliver_now
      redirect_to backoffice_admins_path, notice: "O Administrador (#{@admin.name}) foi atualizado com suceso! "
    else
      render :edit
    end
  end

  def destroy
    authorize @admin
    admin_name = @admin.name
    if @admin.destroy
      redirect_to backoffice_admins_path, notice: "O Administrador (#{admin_name}) foi apagado com suceso!"
    else
      render index
    end
  end

  private

  def set_admin
    @admin = Admin.find(params[:id])
  end

  def params_admin
    if password_blank?
      params[:admin].delete(:password)
      params[:admin].delete(:password_confirmation)
    end
    if @admin.blank?
      params.require(:admin).permit(:name, :email, :role, :password, :password_confirmation)
    else 
      params.require(:admin).permit(policy(@admin).permitted_attributes)
    end
  end
  
  def password_blank?
    params[:admin][:password].blank? && 
    params[:admin][:password_confirmation].blank?
  end

  def remove_all_roles
    Role.availables.each do |role|
      @admin.remove_role role
    end
  end

  def update_roles
    remove_all_roles

    roles = params[:admin].extract!(:role_ids)
    roles[:role_ids].each do |role|
      @admin.add_role(role)
    end
  end
end