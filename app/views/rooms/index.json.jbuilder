json.array!(@rooms) do |room|
  json.extract! room, :id, :name, :description, :capacity, :location_id, :user_id, :admin_user_id
  json.url room_url(room, format: :json)
end
