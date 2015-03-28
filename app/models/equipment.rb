class Equipment < ActiveRecord::Base
	
	belongs_to :admin_user

	has_many :equipment_assingments
	has_many :rooms, :through => :equipment_assingments
	accepts_nested_attributes_for :equipment_assingments
	
	#has_many :rooms, :through => :equipment_rooms
	#accepts_nested_attributes_for :equipment, :allow_destroy => true

	# out for Many to Many
	#has_and_belongs_to_many :rooms, :class_name => "Rooms",  :join_table => "equipments_rooms"
	#accepts_nested_attributes_for :rooms, :allow_destroy => true
	#accepts_nested_attributes_for :equipment, :allow_destroy => true
	
	#attr_accessible :name
	#has_many :equipments_rooms
	#has_many :rooms, :through => :equipments_rooms

	validates :name, :presence => true

end
