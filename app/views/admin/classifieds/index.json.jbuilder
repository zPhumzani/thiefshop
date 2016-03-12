json.array!(@admin_classifieds) do |admin_classified|
  json.extract! admin_classified, :id, :title, :price, :location, :description, :category_id, :slug
  json.url admin_classified_url(admin_classified, format: :json)
end
