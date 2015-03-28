class UpdateAdminColumns < ActiveRecord::Migration
  
  def up
  	# additon of admin to locations
  	add_column :locations, :admin_user_id, :integer, after: :phone_number
  	# additon of admin to equipment
  	add_column :equipment, :admin_user_id, :integer, after: :description
	# additon of super_user to admin_users
  	add_column :admin_users, :super_user, :boolean, after: :remember_created_at

  	#add_column :locations, :admin_user_id, :integer, after: :phone_number
  end

  def down

  	remove_column :locations, :admin_user_id, :integer

  	remove_column :equipment, :admin_user_id, :integer

  	remove_column :admin_users, :super_user, :boolean
  end

end
