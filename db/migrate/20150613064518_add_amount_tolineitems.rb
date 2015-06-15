class AddAmountTolineitems < ActiveRecord::Migration
  def change
    add_column :lineitems, :amount, :integer
  end
end
