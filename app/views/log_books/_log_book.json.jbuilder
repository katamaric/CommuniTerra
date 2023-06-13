json.extract! log_book, :id, :owned_plant_id, :entry_date, :title, :content, :mood_id, :created_at, :updated_at
json.url log_book_url(log_book, format: :json)
