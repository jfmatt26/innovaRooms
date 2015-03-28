class CreateEquipment < ActiveRecord::Migration
  def Up
    create_table :equipment do |t|
      t.string :name, :limit => 50, :null => false
      t.text :description

      t.timestamps null: false
    end
  	puts "*** Adding an index is next ***"
  	add_index("equipment", "name")
  end

end
