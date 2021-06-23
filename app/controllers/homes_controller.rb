class HomesController < ApplicationController
  before_action :authenticate_dog_owner!,except: [:top, :about]

  def top
    #「知りたい！」が多い投稿ランキング機能
    @cognition_ranks = Post.find(Cognition.group(:post_id).order('count(post_id) desc').limit(3).pluck(:post_id))
    
    @answer_ranks = Post.find(Answer.group(:post_id).order('count(post_id) desc').limit(3).pluck(:post_id))
  end

  def about
  end
end
