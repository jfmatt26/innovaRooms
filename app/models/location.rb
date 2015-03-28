class Location < ActiveRecord::Base

	belongs_to :admin_user

	has_many :rooms
end
