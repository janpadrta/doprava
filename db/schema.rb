# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 22) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cars", force: :cascade do |t|
    t.string "name", null: false
    t.string "spz", null: false
    t.boolean "active", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "customers", force: :cascade do |t|
    t.text "name", null: false
    t.text "phone"
    t.text "email"
    t.integer "ic"
    t.text "dic"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "kind"
    t.string "bank_account"
    t.string "street"
    t.string "number"
    t.string "psc"
    t.string "city"
    t.string "bank"
    t.string "swift"
    t.string "iban"
    t.string "raal"
    t.string "timocom"
    t.string "country"
  end

  create_table "invoice_lines", force: :cascade do |t|
    t.bigint "invoice_id", null: false
    t.string "label"
    t.decimal "price", precision: 10, scale: 3
    t.decimal "vat_percent", precision: 10, scale: 3
    t.decimal "vat", precision: 10, scale: 3
    t.decimal "price_with_vat", precision: 10, scale: 3
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["invoice_id"], name: "index_invoice_lines_on_invoice_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.text "reference_number"
    t.bigint "order_id", null: false
    t.text "payment_type"
    t.date "date_of_issue"
    t.date "due_date"
    t.date "date_of_taxable_supply"
    t.decimal "tax_base", precision: 10, scale: 3
    t.decimal "vat", precision: 10, scale: 3
    t.decimal "to_be_paid", precision: 10, scale: 3
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "customer_id"
    t.date "paid_on"
    t.index ["order_id"], name: "index_invoices_on_order_id"
    t.index ["user_id"], name: "index_invoices_on_user_id"
  end

  create_table "orders", force: :cascade do |t|
    t.date "datum"
    t.text "load_type"
    t.text "load_description"
    t.decimal "load_capacity", precision: 10, scale: 3
    t.decimal "load_volume", precision: 10, scale: 3
    t.integer "origin_id"
    t.integer "destination_id"
    t.decimal "distance", precision: 10, scale: 2
    t.boolean "fix_price"
    t.decimal "price_per_km", precision: 10, scale: 3
    t.decimal "price", precision: 10, scale: 3
    t.bigint "customer_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "currency"
    t.text "label"
    t.boolean "finished"
    t.decimal "vat_percentage", precision: 10, scale: 3
    t.integer "car_id"
    t.index ["customer_id"], name: "index_orders_on_customer_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "stops", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.string "type"
    t.string "label", null: false
    t.string "street"
    t.string "number"
    t.string "zip_code"
    t.string "city"
    t.string "country"
    t.boolean "way_back", default: false
    t.integer "sequence"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_stops_on_order_id"
  end

  create_table "users", force: :cascade do |t|
    t.text "email", null: false
    t.text "crypted_password"
    t.text "salt"
    t.text "name"
    t.text "phone"
    t.boolean "admin"
    t.boolean "manager"
    t.boolean "driver"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.integer "access_count_to_reset_password_page", default: 0
    t.integer "failed_logins_count", default: 0
    t.datetime "lock_expires_at"
    t.text "unlock_token"
    t.datetime "last_login_at"
    t.datetime "last_logout_at"
    t.datetime "last_activity_at"
    t.text "last_login_from_ip_address"
    t.string "web"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["last_logout_at", "last_activity_at"], name: "index_users_on_last_logout_at_and_last_activity_at"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token"
    t.index ["unlock_token"], name: "index_users_on_unlock_token"
  end

  add_foreign_key "invoice_lines", "invoices"
  add_foreign_key "invoices", "orders"
  add_foreign_key "invoices", "users"
  add_foreign_key "orders", "customers"
  add_foreign_key "orders", "users"
  add_foreign_key "stops", "orders"
end
