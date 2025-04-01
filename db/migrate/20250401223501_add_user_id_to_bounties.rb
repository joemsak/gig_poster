class AddUserIdToBounties < ActiveRecord::Migration[8.0]
  def change
    add_reference :bounties, :user, null: false, foreign_key: true
  end
end
