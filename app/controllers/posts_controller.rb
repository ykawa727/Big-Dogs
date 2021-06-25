class PostsController < ApplicationController
  before_action :authenticate_dog_owner!,except: [:index, :search, :dog_search]

  def index
    #@posts = Post.page(params[:page]).reverse_order
    @posts = Post.joins(:dog_owner).where(dog_owners: {is_deleted: false}).page(params[:page]).reverse_order
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.dog_owner_id = current_dog_owner.id
    if @post.save
      redirect_to post_path(@post.id)
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @answer = Answer.new
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path
  end

  def search
    @posts = Post.search(params[:category], params[:word])
    render "index"
  end

  def dog_search
    @posts = Post.dog_search(params[:dog_category], params[:age], params[:gender])
    render "index"
  end

  private
  def post_params
    params.require(:post).permit(:dog_id, :category, :title, :body, :keyword, :image)
  end
end
