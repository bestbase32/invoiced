class AddFieldTolineitems < ActiveRecord::Migration
  def change
    add_column :lineitems, :unit_price, :integer
    add_column :lineitems, :quantity, :integer
  end
end
