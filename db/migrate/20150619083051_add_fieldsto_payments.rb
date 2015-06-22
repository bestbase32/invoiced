class AddFieldstoPayments < ActiveRecord::Migration
  def change
    add_column :payments, :pay_date, :date 
    add_column :payments, :pay_desc, :string
    add_column :payments, :pay_method, :string
    add_column :payments, :pay_amount, :integer
    add_column :payments, :pay_total, :integer
    add_column :payments, :pay_remain, :integer
  end
end
