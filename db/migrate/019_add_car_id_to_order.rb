class AddCarIdToOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :car_id, :integer
  end
end
