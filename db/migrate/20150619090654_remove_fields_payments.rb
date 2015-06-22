class RemoveFieldsPayments < ActiveRecord::Migration
  def change
    remove_column :payments, :pay_total, :integer
    remove_column :payments, :pay_remain, :integer
  end
end
