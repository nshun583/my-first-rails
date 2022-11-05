class CategoriesController < ApplicationController
  def index
    @categories = Category.kept
  end

  def show
      @category = Category.kept.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to @category
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @category = Category.kept.find(params[:id])
  end

  def update
    @category = Category.kept.find(params[:id])

    if @category.update(category_params)
      redirect_to @category
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @category = Category.kept.find(params[:id])
    @category.discard

    # this is needed avoid errors in show "when" no active categories are there
    redirect_to action: :index
  end

  private
    def category_params
      params.require(:category).permit(:category)
    end
end
