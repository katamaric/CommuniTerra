json.extract! order_listing, :id, :listing_id, :order_id, :quantity, :created_at, :updated_at
json.url order_listing_url(order_listing, format: :json)
