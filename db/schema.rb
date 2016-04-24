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

ActiveRecord::Schema.define(version: 20160130165747) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "communities", force: :cascade do |t|
    t.integer  "district_id"
    t.string   "name",              limit: 64
    t.integer  "community_type_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "communities", ["district_id"], name: "index_communities_on_district_id", using: :btree

  create_table "districts", force: :cascade do |t|
    t.integer  "province_id"
    t.string   "name",                limit: 64
    t.string   "teryt_code",          limit: 4
    t.string   "teryt_province_code", limit: 2
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "districts", ["province_id"], name: "index_districts_on_province_id", using: :btree

  create_table "place_parts", force: :cascade do |t|
    t.integer  "place_id"
    t.integer  "place_type_id"
    t.string   "name",                  limit: 64
    t.string   "teryt_code",            limit: 7
    t.string   "teryt_place_code",      limit: 7
    t.string   "teryt_place_type_code", limit: 2
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "place_parts", ["place_id"], name: "index_place_parts_on_place_id", using: :btree

  create_table "place_types", force: :cascade do |t|
    t.string   "name",       limit: 32
    t.string   "teryt_code", limit: 2
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "places", force: :cascade do |t|
    t.integer  "community_id"
    t.integer  "place_type_id"
    t.string   "name",                  limit: 64
    t.string   "teryt_code",            limit: 7
    t.string   "teryt_place_type_code", limit: 2
    t.boolean  "hide",                             default: false
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
  end

  add_index "places", ["community_id"], name: "index_places_on_community_id", using: :btree
  add_index "places", ["name"], name: "index_places_on_name", using: :btree

  create_table "provinces", force: :cascade do |t|
    t.string   "name",       limit: 64
    t.string   "teryt_code", limit: 2
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",             default: false
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  add_foreign_key "communities", "districts"
  add_foreign_key "districts", "provinces"
  add_foreign_key "place_parts", "places"
  add_foreign_key "places", "communities"
end
