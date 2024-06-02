class Admins::CategoriesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = current_admin.categories
  end

  def show
  end

  def new
    @category = current_admin.categories.build
  end

  def edit
  end

  def create
    @category = current_admin.categories.build(category_params)

    if @category.save
      redirect_to admins_categories_path(@category), notice: 'Categoría creada correctamente.'
    else
      render :new
    end
  end

  def update
    if @category.update(category_params)
      redirect_to @category, notice: 'Categoría actualizada correctamente.'
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to admins_categories_url, notice: 'Categoría eliminada correctamente.'
  end

  private
    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name, :description)
    end
end
