class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.text :name, null: false
      t.text :address
      t.text :phone
      t.text :email
      t.integer :ic
      t.text :dic

      t.timestamps
    end
  end
end
