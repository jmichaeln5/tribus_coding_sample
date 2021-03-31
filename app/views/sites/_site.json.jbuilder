json.extract! site, :id, :link, :title, :thumbnail_link, :description, :keyword_list, :user_id, :created_at, :updated_at
json.url site_url(site, format: :json)
