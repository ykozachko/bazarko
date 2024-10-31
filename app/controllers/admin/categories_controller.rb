class Admin::CategoriesController < ApplicationController
  before_action :authenticate_user!
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find params[:id]
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_attributes

    if @category.save
      redirect_to admin_category_url(@category)
    else
      render "new", status: :unprocessable_entity
    end
  end

  def edit
    @category = Category.find params[:id]
  end

  def update
    @category = Category.find params[:id]

    if @category.update category_attributes
      redirect_to admin_category_url(@category)
    else
      render "new", status: :unprocessable_entity
    end
  end

  def destroy
    @category = Category.find params[:id]
    @category.destroy
    redirect_to categories_url
  end

  private

  def category_attributes
    params.require(:category).permit(:name)
  end
end
