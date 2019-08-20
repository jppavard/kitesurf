class RenameColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :equipment, :Title, :title
    rename_column :equipment, :Description, :description
  end
end
