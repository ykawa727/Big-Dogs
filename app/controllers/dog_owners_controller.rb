class DogOwnersController < ApplicationController
  before_action :authenticate_dog_owner!

  def show
    @dog_owner = DogOwner.find(params[:id])
    @dogs = @dog_owner.dogs
    #@dog = @dogs
    @posts = Post.where(dog_owner_id: current_dog_owner.id).page(params[:page]).reverse_order
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
    flash[:notice] = "退会手続きを完了しました。"
    redirect_to root_path
  end

   private

  def dog_owner_params
    params.require(:dog_owner).permit(:last_name, :first_name, :nickname, :email, :postal_code, :address, :phone_number, :introduction, :image)
  end

end
