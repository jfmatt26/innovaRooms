class Reservation < ActiveRecord::Base

	extend SimpleCalendar
  	has_calendar

  	belongs_to :admin_user

  	# This is the basic view class
	belongs_to :room


	validates :name, :presence => true
	validates :room, :presence => true
	validates :start_date, :presence => true
	validate :start_must_be_before_end_time
	validate :start_date_must_be_before_today
	
	validates :start_time, :presence => true
	validates :end_time, :presence => true
	validate :reservation_not_conflicted
	

	private

		def reservation_not_conflicted
			valid_start = Reservations.where(:start_date => start_date).where(:room_id => room_id).where("start_time <= ?", start_time).where("end_time >= ?", start_time).where("id != ?", id).count
			if valid_start == 0
				true
			else
				errors.add( :start_time, "conflicting with reservation for same room and day")
			end
			valid_end = Reservations.where(:start_date => start_date).where(:room_id => room_id).where("start_time <= ?", end_time).where("end_time >= ?", end_time).where("id != ?", id).count
			if valid_end == 0
				true
			else
				errors.add( :end_time, "conflicting with reservation for same room and day")
			end
		end


		def start_date_must_be_before_today
		  	valid = start_date && start_date >= Date.today
		  	errors.add(:start_date, "must be today or later") unless valid
		end

		def start_must_be_before_end_time
		  	valid = start_time && end_time && start_time < end_time
		  	errors.add(:start_time, "must be before end time") unless valid
		end


end
