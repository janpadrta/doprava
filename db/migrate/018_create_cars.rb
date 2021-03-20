class CreateCars < ActiveRecord::Migration[6.0]
  def change
    create_table :cars do |t|
      t.string :name, null: false
      t.string :spz, null: false
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
