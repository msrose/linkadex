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

ActiveRecord::Schema.define(:version => 20130630080030) do

  create_table "groups", :force => true do |t|
    t.string   "title"
    t.integer  "color_id",   :limit => 255
    t.boolean  "collapsed"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "links", :force => true do |t|
    t.integer  "tile_id"
    t.string   "title"
    t.string   "href"
    t.integer  "color_id",   :limit => 255
    t.string   "target"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "links", ["tile_id"], :name => "index_links_on_tile_id", :unique => true

  create_table "tiles", :force => true do |t|
    t.integer  "group_id"
    t.integer  "border_color_id",     :limit => 255
    t.integer  "background_color_id", :limit => 255
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  add_index "tiles", ["group_id"], :name => "index_tiles_on_group_id"

end
