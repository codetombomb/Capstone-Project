class review < ActiveRecord::Base
  belongs_to :guest
  belongs_to :HauntedBNB
  belongs_to :reservation
end