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

ActiveRecord::Schema.define(version: 20140528183025) do

  create_table "categories", force: true do |t|
    t.string "genre"
  end

  create_table "events", force: true do |t|
    t.string   "title"
    t.string   "location"
    t.string   "img_url"
    t.integer  "guest_number"
    t.string   "attire"
    t.datetime "event_date"
    t.time     "start_time"
    t.time     "end_time"
    t.string   "food_bio"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reviews", force: true do |t|
    t.integer  "score"
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string "name"
    t.string "email"
    t.string "password"
    t.string "bio"
    t.string "img_url"
  end

end
