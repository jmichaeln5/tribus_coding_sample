class CommentsController < ApplicationController
  before_action :authenticate_user!

  # def index
  #   @comments = Comment.all.where(user_id: current_user).order("created_at DESC")
  #   # byebug
  # end
  #
  # def show
  #   @comment = Comment.find(params[:id])
  # end
  #
  # def edit
  #   # @comment = Comment.find(params[:id])
  # end
  #
  # def update
  #     # @comment = @commentable.comments.find(params[:id])
  #     @comment = Comment.find(params[:id])
  #     if @comment.update_attributes(comment_params)
  #         redirect_to @commentable, notice: "Comment was updated."
  #     else
  #         render :edit, notice: "Comment could not be updated."
  #     end
  # end


  def create
    @comment = @commentable.comments.new comment_params
    # @comment.user_id = current_user.id
    @comment.user = current_user
    # byebug
    @comment.save
    redirect_to @commentable, notice:"Comment Created Successfully."
    # redirect_to @comment, notice:"Comment Created Successfully."
  end


  # def destroy
  #   @comment = Comment.find(params[:id])
  #   # byebug
  #   @comment.destroy
  #   if @comment.destroy
  #     redirect_to @comment.commentable, notice: "Comment deleted."
  #     # redirect_to @commentable, notice: "Comment deleted."
  #   end
  # end


  private

  def comment_params
    # params.require(:comment).permit(:commentable_type, :commentable_id,  :user_id, :body)
    params.require(:comment).permit(:body)
  end

# Uncomment to work!!!
  # def set_commentable
  #   @commentable = Site.find(params[:site_id])
  # end

end
