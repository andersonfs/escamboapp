# frozen_string_literal: true

class Backoffice::CategoriesController < BackofficeController
  before_action :set_category, only: %i[edit update]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = CategoryService.create(params_category)
    unless @category.errors.any?
      redirect_to backoffice_categories_path, notice: "A Categoria (#{@category.description}) foi cadastrada com suceso! "
    else
      render :new
    end
  end

  def edit; end

  def update
    if @category.update(params_category)
      redirect_to backoffice_categories_path, notice: "A Categoria (#{@category.description}) foi atualizada com suceso! "
    else
      render :edit
    end
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def params_category
    params.require(:category).permit(:description)
  end
end
