class ReservationsController < InheritedResources::Base

#load_and_authorize_resource

	#def new
	#	#@reservation = Reservations.find(params(:id))
	#	unless (current_admin_user rescue nil).nil?
	#		reservations
	#	else
	#		false

	#	end

	#end

	#def show
		#@reservations = Reservations.find(params(:id))
		#@rooms = Rooms.find(params(@reservations.room_id))
		#@equipment = Equipment_assingments.
	#end

	# def edit
	# 	@reservations = Reservations.find(params(:id))
	# 	authorize! :update, @reservations
	# 	#if can?
	# 	#	true
	# 	#end
	# end

	# def new
	#	@reservation = Reservations.find(params(:id))
	# 	unauthorized! if cannot? :update, @reservation
	# 	if can?
	# 		true
	# 	end
	# end


	# def create
	# 	@reservation = Reservations.find(params(:id))
	# 	unauthorized! if cannot? :update, @reservation
	# 	if can?
	# 		true
	# 	end
	# end

  private

    def reservation_params
      params.require(:reservation).permit(:name, :description, :room_id, :approved, :start_date, :start_time, :end_time, :user_id, :admin_user_id)
    end
end

