json.extract! cart_listing, :id, :cart_id, :listing_id, :created_at, :updated_at
json.url cart_listing_url(cart_listing, format: :json)
