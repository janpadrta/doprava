class AddKindToCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :customers, :kind, :integer
  end
end
