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

ActiveRecord::Schema[7.1].define(version: 2024_04_09_024348) do
  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.integer "resource_id"
    t.string "author_type"
    t.integer "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

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
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.float "taxes"
    t.float "total"
    t.index ["user_id"], name: "index_plans_on_user_id"
  end

  create_table "provinces", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "gst"
    t.float "pst"
    t.float "hst"
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
    t.integer "category_id", null: false
    t.index ["category_id"], name: "index_rides_on_category_id"
    t.index ["user_id"], name: "index_rides_on_user_id"
  end

  create_table "trips", force: :cascade do |t|
    t.integer "connection_id", null: false
    t.integer "ride_id", null: false
    t.string "status"
    t.float "cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "seats"
    t.integer "plan_id", null: false
    t.index ["connection_id"], name: "index_trips_on_connection_id"
    t.index ["plan_id"], name: "index_trips_on_plan_id"
    t.index ["ride_id"], name: "index_trips_on_ride_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "full_name"
    t.string "phone"
    t.string "email"
    t.string "password_digest"
    t.boolean "verified"
    t.string "address"
    t.boolean "public"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "province_id"
    t.index ["province_id"], name: "index_users_on_province_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "connections", "users", column: "user_1_id"
  add_foreign_key "connections", "users", column: "user_2_id"
  add_foreign_key "payments", "trips"
  add_foreign_key "payments", "users"
  add_foreign_key "plans", "users"
  add_foreign_key "rides", "categories"
  add_foreign_key "rides", "users"
  add_foreign_key "trips", "connections"
  add_foreign_key "trips", "plans"
  add_foreign_key "trips", "rides"
  add_foreign_key "users", "provinces"
end
