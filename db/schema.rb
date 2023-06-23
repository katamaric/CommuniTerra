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

ActiveRecord::Schema[7.0].define(version: 2023_06_23_094129) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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

  create_table "allotment_users", force: :cascade do |t|
    t.bigint "member_id", null: false
    t.bigint "allotment_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["allotment_id"], name: "index_allotment_users_on_allotment_id"
    t.index ["member_id"], name: "index_allotment_users_on_member_id"
  end

  create_table "allotments", force: :cascade do |t|
    t.integer "size"
    t.string "name"
    t.text "description"
    t.datetime "start_date"
    t.datetime "end_date"
    t.bigint "admin_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_id"], name: "index_allotments_on_admin_id"
  end

  create_table "cart_listings", force: :cascade do |t|
    t.bigint "cart_id", null: false
    t.bigint "listing_id", null: false
    t.integer "quantity", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cart_id"], name: "index_cart_listings_on_cart_id"
    t.index ["listing_id"], name: "index_cart_listings_on_listing_id"
  end

  create_table "carts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "deliveries", force: :cascade do |t|
    t.string "delivery_type"
    t.float "delivery_price"
    t.string "delivery_provider"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "kept_plants", force: :cascade do |t|
    t.bigint "owned_plant_id", null: false
    t.bigint "plant_sitting_id"
    t.integer "quantity"
    t.date "start_date"
    t.date "end_date"
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owned_plant_id"], name: "index_kept_plants_on_owned_plant_id"
    t.index ["plant_sitting_id"], name: "index_kept_plants_on_plant_sitting_id"
  end

  create_table "listings", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "listing_title"
    t.string "item_name"
    t.text "description"
    t.float "price"
    t.integer "quantity"
    t.bigint "delivery_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "sold_quantity", default: 0
    t.integer "remaining_quantity"
    t.index ["delivery_id"], name: "index_listings_on_delivery_id"
    t.index ["user_id"], name: "index_listings_on_user_id"
  end

  create_table "log_books", force: :cascade do |t|
    t.bigint "owned_plant_id", null: false
    t.datetime "entry_date"
    t.string "title"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "mood", default: 0
    t.boolean "watered", default: false
    t.index ["owned_plant_id"], name: "index_log_books_on_owned_plant_id"
  end

  create_table "order_listings", force: :cascade do |t|
    t.bigint "listing_id", null: false
    t.bigint "order_id", null: false
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["listing_id"], name: "index_order_listings_on_listing_id"
    t.index ["order_id"], name: "index_order_listings_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.decimal "order_total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "owned_plants", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "plant_id", null: false
    t.bigint "allotment_id"
    t.integer "quantity"
    t.text "description"
    t.string "nickname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["allotment_id"], name: "index_owned_plants_on_allotment_id"
    t.index ["plant_id"], name: "index_owned_plants_on_plant_id"
    t.index ["user_id"], name: "index_owned_plants_on_user_id"
  end

  create_table "plant_sittings", force: :cascade do |t|
    t.bigint "sitter_id"
    t.bigint "asker_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["asker_id"], name: "index_plant_sittings_on_asker_id"
    t.index ["sitter_id"], name: "index_plant_sittings_on_sitter_id"
  end

  create_table "plants", force: :cascade do |t|
    t.text "description"
    t.text "common_name"
    t.text "latin_name"
    t.text "specie"
    t.text "vegetation"
    t.text "foliage"
    t.text "mature_height"
    t.text "mature_width"
    t.text "maintenance_level"
    t.text "maintenance_description"
    t.text "water_requirement_level"
    t.text "water_requirement_description"
    t.text "cold_resistance_level"
    t.text "cold_resistance_description"
    t.text "density"
    t.text "exposure_level"
    t.text "exposure_description"
    t.text "flowering"
    t.text "planting"
    t.text "harvest"
    t.text "pruning"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.string "phone_number"
    t.datetime "birthdate"
    t.text "bio"
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "allotment_users", "allotments", on_delete: :cascade
  add_foreign_key "allotment_users", "users", column: "member_id", on_delete: :cascade
  add_foreign_key "allotments", "users", column: "admin_id", on_delete: :cascade
  add_foreign_key "cart_listings", "carts"
  add_foreign_key "cart_listings", "listings"
  add_foreign_key "carts", "users", on_delete: :cascade
  add_foreign_key "kept_plants", "owned_plants", on_delete: :cascade
  add_foreign_key "kept_plants", "plant_sittings", on_delete: :cascade
  add_foreign_key "listings", "deliveries", on_delete: :cascade
  add_foreign_key "listings", "users", on_delete: :cascade
  add_foreign_key "log_books", "owned_plants"
  add_foreign_key "order_listings", "listings"
  add_foreign_key "order_listings", "orders"
  add_foreign_key "orders", "users", on_delete: :cascade
  add_foreign_key "owned_plants", "allotments", on_delete: :cascade
  add_foreign_key "owned_plants", "plants", on_delete: :cascade
  add_foreign_key "owned_plants", "users", on_delete: :cascade
  add_foreign_key "plant_sittings", "users", column: "asker_id"
  add_foreign_key "plant_sittings", "users", column: "sitter_id"
end
