class AddFieldstoCustomers2 < ActiveRecord::Migration
  def change
    add_column :invoices, :customer_id, :string
  end
end
