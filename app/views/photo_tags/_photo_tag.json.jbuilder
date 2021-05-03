json.extract! photo_tag, :id, :photo_id, :tag_id, :created_at, :updated_at
json.url photo_tag_url(photo_tag, format: :json)
