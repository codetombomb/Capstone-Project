class Guest < ActiveRecord::Base
  has_many :reviews
  has_many :reservations
  has_many :HauntedBNBs, through: :reviews
  has_many :HauntedBNBs, through: :reservations
  has_secure_password
end
