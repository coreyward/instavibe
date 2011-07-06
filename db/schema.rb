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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110705235603) do

  create_table "events", :force => true do |t|
    t.integer  "spot_id",     :null => false
    t.integer  "creator_id",  :null => false
    t.datetime "starts_at",   :null => false
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "plans", :force => true do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.datetime "estimated_arrival_at"
    t.datetime "checked_in_at"
    t.boolean  "active",               :default => true
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spots", :force => true do |t|
    t.string   "url"
    t.string   "name"
    t.text     "description"
    t.string   "geolat"
    t.string   "geolong"
    t.string   "image_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "email",      :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "fb_id"
    t.string   "udid"
  end

end
