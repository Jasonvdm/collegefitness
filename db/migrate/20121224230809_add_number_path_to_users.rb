class AddNumberPathToUsers < ActiveRecord::Migration
  def change
    add_column :users, :number_path, :string
  end
end
