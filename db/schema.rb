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

ActiveRecord::Schema.define(:version => 20130411195153) do

  create_table "animals", :force => true do |t|
    t.date     "date"
    t.string   "metal1"
    t.string   "allflex"
    t.text     "comments"
    t.integer  "sale_id"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.boolean  "sold",            :default => false
    t.string   "temperature"
    t.string   "old_tag"
    t.string   "months_pregnant"
    t.string   "bruc"
    t.string   "chv"
    t.string   "breed"
    t.string   "sex"
    t.string   "age"
    t.integer  "person_id"
  end

  add_index "animals", ["sale_id"], :name => "index_animals_on_sale_id"

  create_table "cvis", :force => true do |t|
    t.string   "cvi_number"
    t.date     "date"
    t.integer  "person_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "sale_id"
  end

  create_table "people", :force => true do |t|
    t.string   "lastname"
    t.string   "firstname"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "zipcode"
  end

  create_table "sales", :force => true do |t|
    t.integer  "buyer_number"
    t.date     "sale_date"
    t.integer  "person_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
