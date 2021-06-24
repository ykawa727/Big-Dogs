class DogsController < ApplicationController
  before_action :authenticate_dog_owner!

  def new
    @dog = Dog.new
  end

  def create
    @dog = Dog.new(dog_params)
    @dog.dog_owner_id = current_dog_owner.id
    if @dog.save(dog_params)
      redirect_to dog_owner_path(current_dog_owner.id)
    else
      render :new
    end
  end

  def index
    #@dogs = Dog.page(params[:page]).reverse_order
    @dogs = Dog.joins(:dog_owner).where(dog_owners: {is_deleted: false}).page(params[:page]).reverse_order
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
