class SorceryCore < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.text :email,            null: false
      t.text :crypted_password
      t.text :salt
      t.text :name
      t.text :phone
      t.boolean :admin
      t.boolean :manager
      t.boolean :driver

      t.timestamps                null: false
    end

    add_index :users, :email, unique: true
  end
end
