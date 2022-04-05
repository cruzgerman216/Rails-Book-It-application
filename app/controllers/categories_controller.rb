class CategoriesController < ApplicationController

  before_action :require_admin, only: [:new, :create]
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save 
      flash[:notice] = "Saved successfully!"
      redirect_to @category 
    else 
      redirect_to categories_path
    end
  end

  def edit
  end

  def update
  end

  private 
  def category_params 
    params.require(:category).permit(:name)
  end
end
