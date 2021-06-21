class HomesController < ApplicationController
  before_action :authenticate_dog_owner!,except: [:top, :about]

  def top
  #   @posts = Post.search(params[:keyword])
  #   @keyword = params[:keyword]
  end

  def about
  end
end
