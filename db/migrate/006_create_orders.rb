class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.date :datum
      t.text :load_type
      t.text :load_description
      t.decimal :load_capacity, precision: 10, scale: 3
      t.decimal :load_volume, precision: 10, scale: 3
      t.integer :origin_id
      t.integer :destination_id
      t.decimal :distance, precision: 10, scale: 2
      t.boolean :fix_price
      t.decimal :price_per_km, precision: 10, scale: 3
      t.decimal :price, precision: 10, scale: 3
      t.references :customer, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
