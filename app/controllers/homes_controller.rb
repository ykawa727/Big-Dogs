class HomesController < ApplicationController
  before_action :authenticate_dog_owner!,except: [:top, :about]

  def top
    #ランキング機能
    @all_ranks = Post.find(Cognition.group(:post_id).order('count(post_id) desc').limit(3).pluck(:post_id))
  end

  def about
  end
end
