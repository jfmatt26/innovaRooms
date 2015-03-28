class Rooms< ActiveRecord::Base
	# This is the ActiveAdmin class

	belongs_to :admin_user
	
	belongs_to :location
	has_many :resorvations
	

	has_many :equipment_assingments
	has_many :equipment, :through => :equipment_assingments
	accepts_nested_attributes_for :equipment_assingments

	validates :name, :presence => true
	validates :location, :presence => true
	
	#has_many :equipment, :through => :equipments_rooms
	# out for Many to Many
	#has_and_belongs_to_many :equipments, :class_name => "Equipment", :join_table => "equipments_rooms"
	#accepts_nested_attributes_for :equipments, :allow_destroy => true
	


	#accepts_nested_attributes_for :rooms, :allow_destroy => true
	#attr_accessible :equipment_id

#  def create
 #   create!{ admin_room_path Rooms.find(params[:rooms_id]) }
 # end

end
