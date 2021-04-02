json.array! @notifications do | notification |
  json.id notification.id # To reference individual Notifications as read
  json.comment_id notification.notifiable.id # To reference individual Notifications as read
  json.body notification.notifiable.body

  json.actor "#{notification.actor.email}"
  json.recipient "#{notification.recipient.email}" # Can Remove, recipient == current user but, could be used
  json.action notification.action
  json.notifiable do
    json.type "a #{notification.notifiable.class.to_s.underscore.humanize.downcase}"
    json.commentParent notification.notifiable
  end

  # json.url site_path(notification.notifiable.commentable_id, anchor: dom_id(notification.notifiable) ) #url with comment id
  json.url site_path(notification.notifiable.commentable_id)
  json.message "#{notification.actor.email} #{notification.action} a #{notification.notifiable.class.to_s.underscore.humanize.downcase} on #{notification.notifiable.commentable.title}"
  json.notification_parent "#{notification.notifiable.commentable.title}"
  json.created_at_in_words "#{time_ago_in_words(notification.created_at)} ago"
  json.read_at notification.read_at

end
