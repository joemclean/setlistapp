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

ActiveRecord::Schema.define(version: 20131212011926) do

  create_table "artists", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "guesses", force: true do |t|
    t.integer  "song_id"
    t.integer  "setlist_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "setlists", force: true do |t|
    t.integer  "user_id"
    t.integer  "show_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shows", force: true do |t|
    t.date     "date",       limit: 255
    t.string   "venue"
    t.string   "time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "artist_id"
    t.boolean  "closed",                 default: false
  end

  create_table "songs", force: true do |t|
    t.string  "name"
    t.integer "artist_id"
  end

  create_table "users", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",      default: false
  end

end
