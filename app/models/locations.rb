class Locations < ActiveRecord::Base
	# This is the ActiveAdmin class

	#belongs_to :admin_users

	has_many :rooms

	validates :name, :presence => true
end
