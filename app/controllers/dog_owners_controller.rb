class DogOwnersController < ApplicationController
  def show
    @dog_owner = DogOwner.find(current_dog_owner.id)
  end

  def edit
    @dog_owner = DogOwner.find(params[:id])
  end
end
