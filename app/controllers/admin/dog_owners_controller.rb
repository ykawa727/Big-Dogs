class Admin::DogOwnersController < ApplicationController
  before_action :authenticate_administrator!

  def index
    @dog_owners = DogOwner.page(params[:page])
  end

  def show
    @dog_owner = DogOwner.find(params[:id])
  end

  def edit
    @dog_owner = DogOwner.find(params[:id])
  end

  def update
    @dog_owner = DogOwner.find(params[:id])
    if @dog_owner.update(dog_owner_params)
      redirect_to admin_dog_owner_path(@dog_owner)
    end
  end

  private
  def dog_owner_params
      params.require(:dog_owner).permit(:last_name, :first_name, :nickname, :postal_code, :address, :phone_number, :email, :is_deleted)
  end
end
