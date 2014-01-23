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

ActiveRecord::Schema.define(version: 20140102024032) do

  create_table "fields", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fields", ["name"], name: "index_fields_on_name"

  create_table "project_covers", force: true do |t|
    t.string   "url"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "project_covers", ["project_id", "url"], name: "index_project_covers_on_project_id_and_url"

  create_table "project_fields", force: true do |t|
    t.integer  "field_id"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "project_fields", ["project_id", "field_id"], name: "index_project_fields_on_project_id_and_field_id"

  create_table "project_owner_fields", force: true do |t|
    t.integer  "project_owner_id"
    t.integer  "field_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "project_owner_fields", ["project_owner_id", "field_id"], name: "index_project_owner_fields_on_project_owner_id_and_field_id"

  create_table "project_owner_images", force: true do |t|
    t.integer  "project_owner_id"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "project_owner_images", ["project_owner_id", "url"], name: "index_project_owner_images_on_project_owner_id_and_url"

  create_table "project_owners", force: true do |t|
    t.integer  "behance_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "company"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "project_owners", ["behance_id"], name: "index_project_owners_on_behance_id"

  create_table "project_ownerships", force: true do |t|
    t.integer  "project_owner_id"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "project_ownerships", ["project_owner_id", "project_id"], name: "index_project_ownerships_on_project_owner_id_and_project_id"

  create_table "project_stats", force: true do |t|
    t.integer  "project_id"
    t.integer  "appreciation"
    t.integer  "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "project_stats", ["project_id"], name: "index_project_stats_on_project_id"

  create_table "projects", force: true do |t|
    t.integer  "behance_id"
    t.string   "name"
    t.text     "description"
    t.integer  "published_on"
    t.integer  "created_on"
    t.integer  "modified_on"
    t.string   "url"
    t.string   "privacy"
    t.float    "for_sale"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "projects", ["behance_id"], name: "index_projects_on_behance_id"

end
