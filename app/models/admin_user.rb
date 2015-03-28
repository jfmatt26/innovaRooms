class AdminUser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_many :rooms
  has_many :reservations
  has_many :locations
  has_many :equipment

  devise :database_authenticatable, 
         :rememberable, :trackable, :validatable#,:recoverable 

end
