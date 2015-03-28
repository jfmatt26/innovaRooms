class EquipmentAssingment < ActiveRecord::Base

	belongs_to :equipment
	belongs_to :rooms

	# To configure a different table name:
	# self.table_name = "name of table"
	
end
