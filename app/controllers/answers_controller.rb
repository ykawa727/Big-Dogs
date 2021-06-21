class AnswersController < ApplicationController
  before_action :authenticate_dog_owner!
  
  def create
    post = Post.find(params[:post_id])
    answer = Answer.new(answer_params)
    answer.dog_owner_id = current_dog_owner.id
    answer.post_id = post.id
    answer.save
    redirect_to post_path(post)
  end

  def destroy
    Answer.find_by(id: params[:id], post_id: params[:post_id]).destroy
    redirect_to post_path(params[:post_id])
  end

  private
  def answer_params
    params.require(:answer).permit(:body)
  end
end
