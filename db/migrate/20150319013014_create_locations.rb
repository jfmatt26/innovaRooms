class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name, :limit => 25, :null =>false
      t.text :description
      t.string :address_l1, :limit => 100
      t.string :address_l2, :limit => 100
      t.string :city, :limit => 50
      t.string :state, :limit =>2
      t.string :zipcode, :limit => 10
      t.string :phone_number , :limit => 20

      t.timestamps null: false
    end
    puts "*** Adding an index is next ***"
    add_index("locations", "name")
  end
end
