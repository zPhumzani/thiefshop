json.array!(@classifieds) do |classified|
  json.extract! classified, :id, :title, :price, :location, :description, :email
  json.url classified_url(classified, format: :json)
end
