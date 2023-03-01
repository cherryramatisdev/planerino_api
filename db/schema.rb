# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_03_01_001304) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "debits", force: :cascade do |t|
    t.string "title"
    t.float "price"
    t.boolean "paid", default: false
    t.bigint "payer_id", null: false
    t.bigint "month_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["month_id"], name: "index_debits_on_month_id"
    t.index ["payer_id"], name: "index_debits_on_payer_id"
  end

  create_table "months", force: :cascade do |t|
    t.string "name"
    t.bigint "year_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["year_id"], name: "index_months_on_year_id"
  end

  create_table "payers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "years", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_years_on_user_id"
  end

  add_foreign_key "debits", "months"
  add_foreign_key "debits", "payers"
  add_foreign_key "months", "years"
  add_foreign_key "years", "users"
end
