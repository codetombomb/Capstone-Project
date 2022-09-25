class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      belongs_to :guest, foreign_key: true
      belongs_to :HauntedBNB, foreign_key: true
      belongs_to :reservation, foreign_key: true
      t.string :title
      t.string :content
      t.integer :rating

      t.timestamps
    end
  end
end
