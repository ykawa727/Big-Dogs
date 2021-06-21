class CognitionsController < ApplicationController
  before_action :authenticate_dog_owner!
  
  def create
    post = Post.find(params[:post_id])
    cognition = current_dog_owner.cognitions.new(post_id: post.id)
    cognition.save
    redirect_to post_path(post)
  end

  def destroy
    post = Post.find(params[:post_id])
    cognition = current_dog_owner.cognitions.find_by(post_id: post.id)
    cognition.destroy
    redirect_to post_path(post)
  end
end
