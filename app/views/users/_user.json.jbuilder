json.extract! user, :id, :email, :name, :phone, :admin, :manager, :driver, :created_at, :updated_at
json.url user_url(user, format: :json)
