json.extract! owned_plant, :id, :user_id, :plant_id, :quantity, :created_at, :updated_at
json.url owned_plant_url(owned_plant, format: :json)
