json.array!(@restaurants) do |restaurant|
  json.extract! restaurant, :id, :name, :description, :address, :comments
  json.url restaurant_url(restaurant, format: :json)
end
