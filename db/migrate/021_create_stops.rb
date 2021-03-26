class CreateStops < ActiveRecord::Migration[6.0]
  def change
    create_table :stops do |t|
      t.belongs_to :order, null: false, foreign_key: true
      t.string :type
      t.string :label, null: false
      t.string :street
      t.string :number
      t.string :zip_code
      t.string :city
      t.string :country
      t.boolean :way_back, default: false
      t.integer :sequence

      t.timestamps
    end
  end
end
