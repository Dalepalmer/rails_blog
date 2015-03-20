class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:alert] = "Post successfully deleted"
    end
    redirect_to :back
  end

  def show
    @show = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "Your post has been saved successfully"
      redirect_to "/"
    else
      flash[:alert] = "There was a problem creating this post"
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :entry, :date)
  end
end
