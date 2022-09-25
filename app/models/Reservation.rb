class Reservation < ActiveRecord::Base
  belongs_to :guest
  belongs_to :HauntedBNB
  has_one :review
end