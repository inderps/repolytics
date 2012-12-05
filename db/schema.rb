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

ActiveRecord::Schema.define(:version => 20121205194035) do

  create_table "commits", :force => true do |t|
    t.string   "sha"
    t.string   "message"
    t.integer  "repo_id"
    t.integer  "story_id"
    t.integer  "commtter1_id"
    t.integer  "commtter2_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "committers", :force => true do |t|
    t.string   "name"
    t.integer  "repo_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "repos", :force => true do |t|
    t.string   "name"
    t.string   "owner"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "stories", :force => true do |t|
    t.integer  "number"
    t.integer  "repo_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
