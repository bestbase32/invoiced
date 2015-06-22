class AddCustomerReftoInvoice < ActiveRecord::Migration
  def change
    remove_column :invoices, :customer_id, :integer
    remove_column :customers, :user_id, :integer
    add_reference :invoices, :customer, index: true, foreign_key: true
    add_reference :customers, :user, index: true, foreign_key: true
  end
end
