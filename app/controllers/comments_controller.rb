class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = @commentable.comments.new comment_params
    @comment.user = current_user
    @comment.save
    redirect_to @commentable, notice:"Comment Created Successfully."
  end

  private

  def comment_params
    # params.require(:comment).permit(:commentable_type, :commentable_id,  :user_id, :body)
    params.require(:comment).permit(:body)
  end
end
