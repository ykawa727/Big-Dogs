class DogOwnersController < ApplicationController
  def show
    @dog_owner = DogOwner.find(current_dog_owner.id)
  end

  def edit
    @dog_owner = DogOwner.find(params[:id])
  end

  def update
    @dog_owner = DogOwner.find(params[:id])
    @dog_owner.update(dog_owner_params)
    redirect_to dog_owner_path(@dog_owner.id)
  end

   private

  def dog_owner_params
    params.require(:dog_owner).permit(:name, :nickname, :email, :postal_code, :address, :phone_number, :introduction, :image)
  end

end
