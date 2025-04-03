class AddLatLngPostalCodeToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :lat, :decimal, precision: 15, scale: 10
    add_column :users, :lng, :decimal, precision: 15, scale: 10
    add_column :users, :postal_code, :string
  end
end
