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

ActiveRecord::Schema[7.1].define(version: 2024_03_18_032137) do
  create_table "connections", force: :cascade do |t|
    t.integer "user_1_id", null: false
    t.integer "user_2_id", null: false
    t.string "connection_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_1_id"], name: "index_connections_on_user_1_id"
    t.index ["user_2_id"], name: "index_connections_on_user_2_id"
  end

  create_table "payments", force: :cascade do |t|
    t.string "status"
    t.float "amount"
    t.integer "trip_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trip_id"], name: "index_payments_on_trip_id"
    t.index ["user_id"], name: "index_payments_on_user_id"
  end

  create_table "plans", force: :cascade do |t|
    t.integer "trip_id", null: false
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trip_id"], name: "index_plans_on_trip_id"
  end

  create_table "rides", force: :cascade do |t|
    t.string "from"
    t.string "to"
    t.integer "seats"
    t.integer "price_share"
    t.integer "user_id", null: false
    t.datetime "time"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_rides_on_user_id"
  end

  create_table "trips", force: :cascade do |t|
    t.integer "connection_id", null: false
    t.integer "ride_id", null: false
    t.string "status"
    t.float "cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["connection_id"], name: "index_trips_on_connection_id"
    t.index ["ride_id"], name: "index_trips_on_ride_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "full_name"
    t.string "phone"
    t.string "email"
    t.boolean "verified"
    t.string "address"
    t.boolean "public"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "connections", "users", column: "user_1_id"
  add_foreign_key "connections", "users", column: "user_2_id"
  add_foreign_key "payments", "trips"
  add_foreign_key "payments", "users"
  add_foreign_key "plans", "trips"
  add_foreign_key "rides", "users"
  add_foreign_key "trips", "connections"
  add_foreign_key "trips", "rides"
end
