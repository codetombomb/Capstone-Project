class CreateHauntedBnbs < ActiveRecord::Migration[6.1]
  def change
    create_table :haunted_bnbs do |t|
      t.string :name
      t.string :street
      t.string :city
      t.string :state
      t.string :summary
      t.string :image_url
      t.integer :price

      t.timestamps
    end
  end
end
