class AddFieldstoCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :phone_no, :integer
    add_column :customers, :email, :string
  end
end
