class CreateAdmin < ActiveRecord::Migration
   def migrate(direction)
    super
    # Create a default user
    AdminUser.create!(email: 'sample@example.com', password: 'password', password_confirmation: 'password') if direction == :up
  end
end
