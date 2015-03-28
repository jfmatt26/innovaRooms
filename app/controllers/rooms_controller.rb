class RoomsController < InheritedResources::Base

  private

    def room_params
      params.require(:room).permit(:name, :description, :capacity, :location_id, :user_id, :admin_user_id, :equipment_id)
    end
end

