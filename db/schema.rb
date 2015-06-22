# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150619142559) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customers", force: :cascade do |t|
    t.string   "customer_name"
    t.string   "customer_address"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "phone_no"
    t.string   "email"
    t.integer  "user_id"
  end

  add_index "customers", ["user_id"], name: "index_customers_on_user_id", using: :btree

  create_table "invoices", force: :cascade do |t|
    t.string   "invoice_no"
    t.date     "due_date"
    t.date     "issue_date"
    t.integer  "total"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "customer_id"
    t.integer  "pay_remain"
    t.integer  "pay_total"
  end

  add_index "invoices", ["customer_id"], name: "index_invoices_on_customer_id", using: :btree

  create_table "lineitems", force: :cascade do |t|
    t.integer  "invoice_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "product_id"
    t.string   "product_name"
    t.integer  "amount"
    t.integer  "unit_price"
    t.integer  "quantity"
  end

  add_index "lineitems", ["invoice_id"], name: "index_lineitems_on_invoice_id", using: :btree

  create_table "payments", force: :cascade do |t|
    t.integer  "invoice_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date     "pay_date"
    t.string   "pay_desc"
    t.string   "pay_method"
    t.integer  "pay_amount"
  end

  add_index "payments", ["invoice_id"], name: "index_payments_on_invoice_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "profile_image_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address"
    t.string   "phone"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "customers", "users"
  add_foreign_key "invoices", "customers"
  add_foreign_key "lineitems", "invoices"
  add_foreign_key "payments", "invoices"
end
