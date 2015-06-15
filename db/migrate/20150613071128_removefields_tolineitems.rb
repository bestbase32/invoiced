class RemovefieldsTolineitems < ActiveRecord::Migration
  def change
     remove_column :lineitems, :unit_price, :string
    remove_column :lineitems, :quantity, :string
  end
end
