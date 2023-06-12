json.extract! user, :id, :first_name, :last_name, :username, :phone_number, :birthdate, :bio, :created_at, :updated_at
json.url user_url(user, format: :json)
