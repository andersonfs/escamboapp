# frozen_string_literal: true

class Backoffice::AdminsController < BackofficeController
  before_action :set_admin, only: %i[edit update destroy]
  # Pundit - Garante que colocamos a verificação. Se não colocar, um erro é lançado.
  after_action :verify_authorized, only: :new
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
    if @admin.save
      redirect_to backoffice_admins_path, notice: "O Administrador (#{@admin.name}) foi cadastrado com suceso! "
    else
      render :new
    end
  end

  def edit; end

  def update
    if @admin.update(params_admin)
      redirect_to backoffice_admins_path, notice: "O Administrador (#{@admin.name}) foi atualizado com suceso! "
    else
      render :edit
    end
  end

  def destroy
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
    passwd = params[:admin][:password]
    passwd_confirmation = params[:admin][:password_confirmation]

    if passwd.blank? && passwd_confirmation.blank?
      params[:admin].delete(:password)
      params[:admin].delete(:password_confirmation)
    end

    params.require(:admin).permit(:name, :email, :password, :password_confirmation, :role)
  end  
end