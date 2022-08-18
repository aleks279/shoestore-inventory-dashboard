class CreateStoresInventories < ActiveRecord::Migration[7.0]
  def change
    create_table :stores do |t|
      t.string :name

      t.timestamps
    end

    create_table :shoes do |t|
      t.string :model
      t.integer :inventory

      t.references :store

      t.timestamps
    end
  end
end
