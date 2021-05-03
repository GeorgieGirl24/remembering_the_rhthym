json.extract! concert, :id, :band_name, :venue, :concert_date, :created_at, :updated_at
json.url concert_url(concert, format: :json)
