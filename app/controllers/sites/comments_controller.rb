class Sites::CommentsController < CommentsController
  before_action :set_commentable

  private

  def set_commentable
    @commentable = Site.find(params[:site_id])
  end

end
