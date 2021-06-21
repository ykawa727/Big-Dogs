class ReferencesController < ApplicationController
  before_action :authenticate_dog_owner!

  def create
    answer = Answer.find(params[:answer_id])
    reference = current_dog_owner.references.new(answer_id: answer.id)
    reference.save
    redirect_to post_path(answer.post)
  end

  def destroy
    answer = Answer.find(params[:answer_id])
    reference = current_dog_owner.references.find_by(answer_id: answer.id)
    reference.destroy
    redirect_to post_path(answer.post)
  end
end
