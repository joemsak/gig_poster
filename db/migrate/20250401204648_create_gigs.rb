class CreateGigs < ActiveRecord::Migration[8.0]
  def change
    create_table :gigs do |t|
      t.string :title
      t.decimal :bounty, precision: 5, scale: 2

      t.timestamps
    end
  end
end
