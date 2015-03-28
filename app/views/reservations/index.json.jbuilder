json.array!(@reservations) do |reservation|
  json.extract! reservation, :id, :name, :description, :room_id, :approved, :start_date, :start_time, :end_time, :user_id, :admin_user_id
  json.url reservation_url(reservation, format: :json)
end
