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
    redirect_to posts_path
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "Task successfully updated!"
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "Your post has been saved successfully"
      redirect_to posts_path
    else
      flash[:alert] = "There was a problem creating this post"
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :entry, :date)
  end
end
