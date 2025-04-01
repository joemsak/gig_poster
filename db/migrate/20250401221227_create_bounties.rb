class CreateBounties < ActiveRecord::Migration[8.0]
  def change
    create_table :bounties do |t|
      t.string :title
      t.decimal :amount, precision: 5, scale: 2

      t.timestamps
    end
  end
end
