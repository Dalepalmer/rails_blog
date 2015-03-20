class CommentsController < ApplicationController

  def new
    @comment = comment.new
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      flash[:alert] = "Comment successfully deleted"
    end
    redirect_to comments_path
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      flash[:notice] = "Your Comment has been saved successfully"
      redirect_to comments_path
    else
      flash[:alert] = "There was a problem creating this comment"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:post_id, :username, :description)
  end
end
