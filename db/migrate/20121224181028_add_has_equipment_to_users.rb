class AddHasEquipmentToUsers < ActiveRecord::Migration
  def change
    add_column :users, :has_equipment, :boolean
    add_column :users, :equipment_owned, :string
  end
end
