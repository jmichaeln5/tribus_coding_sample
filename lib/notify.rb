module Notify
  def affirm_notification(comment)
    (comment.commentable.users.uniq - [current_user]).each do |user|
      @notification = Notification.create(recipient: user, actor: current_user, action:"posted", notifiable: comment)
      ActionCable.server.broadcast('notification_channel', 'title' )
    end
  end
end
