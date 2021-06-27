class AnswerFavoritesController < ApplicationController
  before_action :authenticate_dog_owner!

  def create
    @answer = Answer.find(params[:answer_id])
    @post = @answer.post
    answer_favorite = current_dog_owner.answer_favorites.new(answer_id: @answer.id)
    answer_favorite.save
  end

  def destroy
    @answer = Answer.find(params[:answer_id])
    @post = @answer.post
    answer_favorite = current_dog_owner.answer_favorites.find_by(answer_id: @answer.id)
    answer_favorite.destroy
  end
end
