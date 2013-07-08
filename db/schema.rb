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

ActiveRecord::Schema.define(:version => 20130708185418) do

  create_table "colors", :force => true do |t|
    t.string   "hex_value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "alias"
  end

  add_index "colors", ["hex_value"], :name => "index_colors_on_hex_value"

  create_table "groups", :force => true do |t|
    t.string   "title"
    t.integer  "color_id",   :limit => 255
    t.boolean  "collapsed"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "groups", ["color_id"], :name => "index_groups_on_color_id"

  create_table "links", :force => true do |t|
    t.string   "title"
    t.string   "href"
    t.integer  "color_id",            :limit => 255
    t.string   "target"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.integer  "group_id"
    t.integer  "background_color_id"
    t.integer  "border_color_id"
  end

  add_index "links", ["color_id"], :name => "index_links_on_color_id"

end
