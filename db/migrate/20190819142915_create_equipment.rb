class CreateEquipment < ActiveRecord::Migration[5.2]
  def change
    create_table :equipment do |t|
      t.string :brand
      t.integer :size
      t.string :style
      t.integer :rating
      t.string :model
      t.string :photo
      t.string :location
      t.integer :price
      t.references :user, foreign_key: true
      t.boolean :active

      t.timestamps
    end
  end
end
