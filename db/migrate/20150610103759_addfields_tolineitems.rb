class AddfieldsTolineitems < ActiveRecord::Migration
  def change
    add_column :lineitems, :product_id, :string
    add_column :lineitems, :product_name, :string
    add_column :lineitems, :unit_price, :interger
    add_column :lineitems, :quantity, :interger
  end
end
