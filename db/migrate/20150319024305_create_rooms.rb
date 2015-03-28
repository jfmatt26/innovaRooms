class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :name, :limit => 50, :null => false
      t.text :description
      t.integer :capacity, :limit => 5
      t.integer :location_id
      t.integer :user_id
      t.integer :admin_user_id

      t.timestamps null: false
    end
    puts "*** Adding an index is next ***"
    add_index("rooms", "name")
  end
end
