class AddCarrierToUsers < ActiveRecord::Migration
  def change
    add_column :users, :carrier, :string
    add_column :users, :contact_pref, :string
  end
end
