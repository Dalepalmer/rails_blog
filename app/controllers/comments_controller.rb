class CommentsController < ApplicationController

  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    if @comment.destroy
      flash[:alert] = "Comment successfully deleted"
    end
    redirect_to post_path(@post)
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    if @comment.save
      flash[:notice] = "Your Comment has been saved successfully"
      redirect_to post_path(@post)
    else
      flash[:alert] = "There was a problem creating this comment"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:post_id, :username, :description)
  end
end
