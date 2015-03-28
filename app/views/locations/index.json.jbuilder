json.array!(@locations) do |location|
  json.extract! location, :id, :name, :description, :address_l1, :address_l2, :city, :state, :zipcode, :phone_number
  json.url location_url(location, format: :json)
end
