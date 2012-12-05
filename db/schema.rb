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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121205041416) do

  create_table "admin_users", :force => true do |t|
    t.string   "first_name",      :limit => 25
    t.string   "last_name",       :limit => 50
    t.string   "email",           :limit => 100, :null => false
    t.string   "hashed_password", :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username",        :limit => 25
    t.string   "salt",            :limit => 40
    t.string   "phone",           :limit => 25
  end

  add_index "admin_users", ["username"], :name => "index_admin_users_on_username"

  create_table "opposing_teams", :force => true do |t|
    t.string   "name"
    t.string   "city"
    t.string   "location"
    t.integer  "sport_id"
    t.boolean  "visible",                   :default => false
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
    t.string   "abbreviation", :limit => 3
  end

  create_table "sections", :force => true do |t|
    t.string   "name"
    t.string   "row"
    t.string   "seat"
    t.string   "price"
    t.boolean  "visible",                  :default => false
    t.integer  "ticket_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "value",      :limit => 25
    t.boolean  "sold",                     :default => false
  end

  create_table "teams", :force => true do |t|
    t.integer  "team_id"
    t.string   "name"
    t.integer  "sport_id"
    t.string   "location"
    t.boolean  "visible",    :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "teams", ["team_id"], :name => "index_teams_on_team_id"

  create_table "tickets", :force => true do |t|
    t.string   "name"
    t.boolean  "visible",           :default => false
    t.datetime "game_at"
    t.integer  "team_id"
    t.integer  "opposing_teams_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "promo"
    t.string   "notes"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "game",       :limit => 250
    t.string   "date",       :limit => 250
  end

end
