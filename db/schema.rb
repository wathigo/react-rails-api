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

ActiveRecord::Schema.define(version: 2020_01_29_091637) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favourites", force: :cascade do |t|
    t.bigint "users_id"
    t.bigint "properties_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["properties_id"], name: "index_favourites_on_properties_id"
    t.index ["users_id"], name: "index_favourites_on_users_id"
  end

  create_table "properties", force: :cascade do |t|
    t.bigint "category_id"
    t.string "name"
    t.string "address"
    t.string "status", default: "available"
    t.string "description"
    t.integer "price"
    t.float "latt"
    t.float "long"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_properties_on_category_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "favourites", "properties", column: "properties_id"
  add_foreign_key "favourites", "users", column: "users_id"
  add_foreign_key "properties", "categories"
end
