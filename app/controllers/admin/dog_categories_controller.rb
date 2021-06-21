class Admin::DogCategoriesController < ApplicationController
  before_action :authenticate_administrator!
  
  def index
    @dog_category = DogCategory.new
    @dog_categories = DogCategory.all
  end

  def create
    dog_category = DogCategory.new(dog_category_params)
    if dog_category.save(dog_category_params)
      flash[:notice] = "保存ができました！"
      redirect_to admin_dog_categories_path
    else
      flash.now[:alert] = "保存ができませんでした・・・"
      render :index
    end
  end

  def edit
    @dog_category = DogCategory.find(params[:id])
  end

  def update
    dog_category = DogCategory.find(params[:id])
    if dog_category.update(dog_category_params)
      flash[:notice] = "犬種名を更新しました！"
      redirect_to admin_dog_categories_path
    else
      flash.now[:alert] = "犬種名を更新できませんでした・・・"
      render :edit
    end
  end

  def destroy
    dog_category = DogCategory.find(params[:id])
    dog_category.destroy
    redirect_to admin_dog_categories_path
  end

  private
  def dog_category_params
    params.require(:dog_category).permit(:category)
  end
end
