class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
  @comment = @commentable.comments.new(comment_params)
  @comment.user = current_user
    if @comment.save
      (@comment.commentable.users.uniq - [current_user]).each do |user|
          @notification = Notification.create(recipient: user, actor: current_user, action:"posted", notifiable: @comment)
          ActionCable.server.broadcast('notification_channel', 'title' )
      end

      respond_to do |format|
        format.html { redirect_to @commentable, :notice => "Comment Created Successfully." }
        # format.html { redirect_to dashboard_path, :notice => "Comment Created Successfully." }
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
