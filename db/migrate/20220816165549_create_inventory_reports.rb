class CreateInventoryReports < ActiveRecord::Migration[7.0]
  def change
    create_table :inventory_reports do |t|
      t.string :store
      t.string :model
      t.integer :inventory

      t.timestamps
    end
  end
end