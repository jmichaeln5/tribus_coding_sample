class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = @commentable.comments.new comment_params
    @comment.user = current_user
    if @comment.save
      redirect_to @commentable, notice:"Comment Created Successfully."
    else
      redirect_to @commentable, alert:"Comment Could Not Be Created."
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_back(fallback_location: root_path, notice: "Comment Deleted Successfully.")
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
