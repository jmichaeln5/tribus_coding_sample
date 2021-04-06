require 'notify'

class CommentsController < ApplicationController
  include Notify
  before_action :authenticate_user!

  def create
  @comment = @commentable.comments.new(comment_params)
  @comment.user = current_user
    #   #Module in "lib/notify.rb"
    affirm_notification(@comment)
    if @comment.save
      respond_to do |format|
        # format.html { redirect_to @commentable, :notice => "Comment Created Successfully." }
        format.html { redirect_to dashboard_path, :notice => "Comment Created Successfully." }
        format.js
      end
    else
      redirect_to @commentable, alert: "Something went wrong..."
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
