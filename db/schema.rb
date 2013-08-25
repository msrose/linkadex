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

ActiveRecord::Schema.define(:version => 20130825195313) do

  create_table "colors", :force => true do |t|
    t.string   "hex_value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "alias"
    t.integer  "user_id"
  end

  add_index "colors", ["hex_value"], :name => "index_colors_on_hex_value"
  add_index "colors", ["user_id"], :name => "index_colors_on_user_id"

  create_table "groups", :force => true do |t|
    t.string   "title"
    t.boolean  "collapsed"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "color_id"
    t.integer  "order_rank"
    t.integer  "user_id"
  end

  add_index "groups", ["color_id"], :name => "index_groups_on_color_id"
  add_index "groups", ["user_id"], :name => "index_groups_on_user_id"

  create_table "links", :force => true do |t|
    t.string   "title"
    t.string   "href"
    t.string   "target"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.integer  "color_id"
    t.integer  "group_id"
    t.integer  "background_color_id"
    t.integer  "border_color_id"
    t.integer  "order_rank"
  end

  add_index "links", ["background_color_id"], :name => "index_links_on_background_color_id"
  add_index "links", ["border_color_id"], :name => "index_links_on_border_color_id"
  add_index "links", ["color_id"], :name => "index_links_on_color_id"
  add_index "links", ["group_id"], :name => "index_links_on_group_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "remember_token"
    t.string   "verification_token"
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"
  add_index "users", ["verification_token"], :name => "index_users_on_verification_token"

end
