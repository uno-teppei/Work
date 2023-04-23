class PostsController < ApplicationController

  before_action :authenticate_user!

  def index
    @posts = Post.all
    @user = User.find(current_user.id)
  end

  def new
    @user = current_user.id
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:notice] = "投稿を作成しました"
      redirect_to posts_path
    else
      flash.now[:alert] = "投稿の作成に失敗しました"
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:id, :airport_name, :prefecture, :city, :impression).merge(user_id: current_user.id)
  end
end
