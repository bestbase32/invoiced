class AddFieldsPayments1 < ActiveRecord::Migration
  def change
    add_column :payments, :pay_total, :integer
  end
end
