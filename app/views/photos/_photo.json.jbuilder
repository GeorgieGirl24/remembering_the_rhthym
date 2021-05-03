json.extract! photo, :id, :name, :concert_date, :loved, :liked, :user_id, :concert_id, :created_at, :updated_at
json.url photo_url(photo, format: :json)
