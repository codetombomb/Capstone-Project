class HauntedBnb < ActiveRecord::Base
  has_many :reviews
  has_many :reservations
  has_many :guests, through: :reviews
  has_many :guests, through: :reservations

  def available?
    self.reservations.each do |reservation|
      if reservation.check_in <= Date.today && reservation.check_out >= Date.today
        return false
      end
    end
    return true
  end
end
