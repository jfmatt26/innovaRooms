class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string :name, :limit => 50, :null => false
      t.string :description
      t.integer :room_id
      t.boolean :approved, :default => false
      t.date :start_date
      t.time :start_time
      t.time :end_time
      t.integer :user_id
      t.integer :admin_user_id

      t.timestamps null: false
    end
    puts "*** Adding an index is next ***"
    add_index("reservations", "name")
  end
end
