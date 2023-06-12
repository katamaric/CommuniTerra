json.extract! listing, :id, :user_id, :listing_title, :item_name, :description, :price, :quantity, :delivery_id, :created_at, :updated_at
json.url listing_url(listing, format: :json)
