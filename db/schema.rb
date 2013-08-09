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

ActiveRecord::Schema.define(version: 20130809101511) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "answers", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.spatial  "coords",     limit: {:srid=>3785, :type=>"point"}
    t.integer  "region_id"
  end

  add_index "answers", ["region_id"], :name => "index_answers_on_region_id"

  create_table "regions", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.spatial  "poly",       limit: {:srid=>0, :type=>"polygon"}
    t.string   "name"
    t.spatial  "multi",      limit: {:srid=>0, :type=>"multi_polygon"}
  end

  add_index "regions", ["poly"], :name => "index_regions_on_poly", :spatial => true

end
