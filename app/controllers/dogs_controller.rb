class DogsController < ApplicationController
  def new
    @dog = Dog.new
  end

  def create
    @dog = Dog.new(dog_params)
    @dog.dog_owner_id = current_dog_owner.id
    if @dog.save(dog_params)
      flash[:notice] = "保存ができました！"
      redirect_to dog_owner_path(current_dog_owner.id)
    else
      flash.now[:alert] = "保存ができませんでした・・・"
      render :new
    end
  end

  def index
    @dogs = Dog.all
  end

  def show
    @dog = Dog.find(params[:id])
  end

  def edit
    @dog = Dog.find(params[:id])
  end

  def update
    @dog = Dog.find(params[:id])
    @dog.update(dog_params)
    redirect_to dog_path(@dog.id)
  end

  def destroy
    @dog = Dog.find(params[:id])
    @dog.destroy
    redirect_to dog_owner_path(@dog.dog_owner.id)
  end

  private
  def dog_params
    params.require(:dog).permit(:dog_category_id, :name, :age, :gender, :introduction, :image)
  end
end
