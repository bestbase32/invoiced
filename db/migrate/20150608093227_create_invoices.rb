class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.string :invoice_no
      t.date :due_date
      t.date :issue_date
      t.integer :total

      t.timestamps null: false
    end
  end
end
