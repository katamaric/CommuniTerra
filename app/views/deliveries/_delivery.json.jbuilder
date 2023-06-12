json.extract! delivery, :id, :delivery_type, :delivery_price, :delivery_provider, :created_at, :updated_at
json.url delivery_url(delivery, format: :json)
