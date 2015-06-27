json.array!(@restaurants) do |restaurant|
  json.extract! restaurant, :id, :name, :tel, :address, :url, :image
  json.url restaurant_url(restaurant, format: :json)
end
