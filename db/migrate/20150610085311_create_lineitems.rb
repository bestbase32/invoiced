class CreateLineitems < ActiveRecord::Migration
  def change
    create_table :lineitems do |t|
      t.references :invoice, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
