json.extract! user, :id, :name, :email, :password, :confirm_password, :created_at, :updated_at
json.url user_url(user, format: :json)
