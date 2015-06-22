class AddFieldsPayments2 < ActiveRecord::Migration
  def change
    add_column :invoices, :pay_remain, :integer
  end
end
