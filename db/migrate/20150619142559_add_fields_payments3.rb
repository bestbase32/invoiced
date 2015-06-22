class AddFieldsPayments3 < ActiveRecord::Migration
  def change
    remove_column :payments, :pay_total, :integer
    add_column :invoices, :pay_total, :integer
  end
end
