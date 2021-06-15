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
  
  def destroy
    @dog_owner = current_dog_owner
    @dog_owner.update(is_deleted: true)
    reset_session
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to root_path
  end 

   private

  def dog_owner_params
    params.require(:dog_owner).permit(:name, :nickname, :email, :postal_code, :address, :phone_number, :introduction, :image)
  end

end
