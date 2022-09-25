class CreateReservation < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      belongs_to :guest, foreign_key: true
      belongs_to :HauntedBNB, foreign_key: true
      t.datetime :check_in
      t.datetime :check_out

      t.timestamps
    end
  end
end
