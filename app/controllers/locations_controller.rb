class LocationsController < InheritedResources::Base

  private

    def location_params
      params.require(:location).permit(:name, :description, :address_l1, :address_l2, :city, :state, :zipcode, :phone_number)
    end
end

