class AddWebToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :web, :string
  end
end
