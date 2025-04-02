class AddPostalCodeToBounties < ActiveRecord::Migration[8.0]
  def change
    add_column :bounties, :postal_code, :string
  end
end
