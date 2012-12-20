class AddEmailPrefToUsers < ActiveRecord::Migration
  def change
    add_column :users, :boolean, :email_pref
  end
end
