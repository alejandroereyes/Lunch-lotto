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

ActiveRecord::Schema.define(version: 20150619002618) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "foods", force: :cascade do |t|
    t.boolean  "easy_breezy",     default: false
    t.boolean  "health_nut",      default: false
    t.boolean  "wild_child",      default: false
    t.boolean  "lux_lunch",       default: false
    t.boolean  "casual_sit_down", default: false
    t.integer  "user_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "foods", ["user_id"], name: "index_foods_on_user_id", using: :btree

  create_table "matches", force: :cascade do |t|
    t.string   "event_id"
    t.integer  "pair"
    t.boolean  "accept"
    t.string   "day"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "matches", ["user_id"], name: "index_matches_on_user_id", using: :btree

  create_table "messages", force: :cascade do |t|
    t.string   "post"
    t.string   "event_id"
    t.integer  "user_id"
    t.integer  "match_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "messages", ["match_id"], name: "index_messages_on_match_id", using: :btree
  add_index "messages", ["user_id"], name: "index_messages_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "network"
    t.string   "linked_in"
    t.string   "twitter"
    t.text     "bio"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "foods", "users"
  add_foreign_key "matches", "users"
  add_foreign_key "messages", "matches"
  add_foreign_key "messages", "users"
end
