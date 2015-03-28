class CreateEquimentAssingments < ActiveRecord::Migration
 
  def change
    create_table :equipment_assingments do |t|
    	t.references :equipment
    	t.references :rooms
      	t.timestamps null: false
    end
    add_index :equipment_assingments, ["equipment_id", "rooms_id"]
  end

end
