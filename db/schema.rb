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

ActiveRecord::Schema[7.0].define(version: 2024_07_17_210024) do
  create_table "construction_sites", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "total_doors"
    t.integer "floors"
    t.string "address"
  end

  create_table "delivered_deliveries", force: :cascade do |t|
    t.integer "number_of_doors"
    t.date "delivery_date"
    t.time "delivery_time"
    t.datetime "submitted_at", precision: nil
    t.integer "construction_site_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["construction_site_id"], name: "index_delivered_deliveries_on_construction_site_id"
  end

  create_table "deliveries", force: :cascade do |t|
    t.integer "construction_site_id", null: false
    t.integer "number_of_doors", null: false
    t.date "delivery_date", null: false
    t.time "delivery_time", null: false
    t.string "type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["construction_site_id"], name: "index_deliveries_on_construction_site_id"
  end

  create_table "door_installations", force: :cascade do |t|
    t.integer "number_of_doors", null: false
    t.date "installation_date", null: false
    t.time "installation_time", null: false
    t.datetime "submitted_at", precision: nil, default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.integer "construction_site_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "floor"
    t.string "block"
    t.index ["construction_site_id"], name: "index_door_installations_on_construction_site_id"
  end

  create_table "floors", force: :cascade do |t|
    t.integer "number_of_floors"
    t.integer "construction_site_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["construction_site_id"], name: "index_floors_on_construction_site_id"
  end

  create_table "requested_deliveries", force: :cascade do |t|
    t.integer "number_of_doors"
    t.date "delivery_date"
    t.time "delivery_time"
    t.datetime "submitted_at", precision: nil
    t.integer "construction_site_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status", default: "pending"
    t.index ["construction_site_id"], name: "index_requested_deliveries_on_construction_site_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "delivered_deliveries", "construction_sites"
  add_foreign_key "deliveries", "construction_sites"
  add_foreign_key "door_installations", "construction_sites"
  add_foreign_key "floors", "construction_sites"
  add_foreign_key "requested_deliveries", "construction_sites"
end
