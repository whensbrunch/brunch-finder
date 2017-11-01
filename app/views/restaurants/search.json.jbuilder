json.restaurants do
  json.array!(@restaurants) do |r|
    json.name r.name
    json.address r.address
    json.id   r.id
    json.url  restaurant_path(r)
  end
end
