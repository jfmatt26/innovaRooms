class Room < ActiveRecord::Base
	#attr_accessible :equipment_id

	belongs_to :admin_user


	belongs_to :location
	has_many :resorvations
	#has_many :equipment_rooms
	has_many :equipment_assingments
	has_many :equipment, :through => :equipment_assingments
	accepts_nested_attributes_for :equipment_assingments

	
	#has_and_belongs_to_many :equipments_rooms, :class_name => "Rooms",  :join_table => "equipments_rooms"
	#accepts_nested_attributes_for :equipments_rooms, :allow_destroy => true
	
	#has_and_belongs_to_many :equipment, :join_table => "equipments_rooms"
	#has_many :equipment, :through => :equipment_rooms
	#accepts_nested_attributes_for :equipment, :allow_destroy => true
	#accepts_nested_attributes_for :rooms, :allow_destroy => true

end
