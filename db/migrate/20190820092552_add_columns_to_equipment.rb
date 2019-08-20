class AddColumnsToEquipment < ActiveRecord::Migration[5.2]
  def change
    add_column :equipment, :Title, :string
    add_column :equipment, :Description, :text
  end
end
