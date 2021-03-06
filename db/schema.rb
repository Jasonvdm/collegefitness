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

ActiveRecord::Schema.define(:version => 20130108084141) do

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "number"
    t.datetime "created_at",                                       :null => false
    t.datetime "updated_at",                                       :null => false
    t.string   "email",                    :default => "",         :null => false
    t.string   "encrypted_password",       :default => "",         :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",            :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "carrier"
    t.string   "contact_pref"
    t.boolean  "is_admin"
    t.boolean  "has_equipment"
    t.string   "equipment_owned"
    t.string   "number_path"
    t.string   "current_level_difficulty", :default => "Beginner"
    t.string   "last_workout"
    t.integer  "total_num_workouts",       :default => 0
    t.string   "beta_key"
  end

  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "workouts", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "difficulty"
    t.boolean  "has_equipment"
    t.string   "equipment_list"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "workout_type"
    t.integer  "wid"
  end

end
