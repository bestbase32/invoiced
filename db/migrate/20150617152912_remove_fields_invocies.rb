class RemoveFieldsInvocies < ActiveRecord::Migration
  def change
    remove_column :invoices, :customer_id, :string
  end
end
