json.array!(@admin_users) do |admin_user|
  json.extract! admin_user, :id, :slug, :first_name, :last_name, :password, :password_confirmation, :email, :admin
  json.url admin_user_url(admin_user, format: :json)
end
