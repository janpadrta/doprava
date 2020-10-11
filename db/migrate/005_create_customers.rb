class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :name, null: false
      t.string :address
      t.string :phone
      t.string :email
      t.integer :ic
      t.string :dic

      t.timestamps
    end
  end
end
