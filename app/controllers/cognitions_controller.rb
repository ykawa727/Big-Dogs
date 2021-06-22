class CognitionsController < ApplicationController
  before_action :authenticate_dog_owner!

  def create
    @post = Post.find(params[:post_id])
    cognition = current_dog_owner.cognitions.new(post_id: @post.id)
    cognition.save
  end

  def destroy
    @post = Post.find(params[:post_id])
    cognition = current_dog_owner.cognitions.find_by(post_id: @post.id)
    cognition.destroy
  end
end
