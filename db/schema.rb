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

ActiveRecord::Schema.define(version: 20140716154623) do

  create_table "application_teches", force: true do |t|
    t.integer  "tech_id"
    t.integer  "application_id"
    t.integer  "application_role"
    t.integer  "order_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "attachments", force: true do |t|
    t.string   "path"
    t.string   "doctype"
    t.integer  "serialnum"
    t.integer  "ticket_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "category_teches", force: true do |t|
    t.integer  "tech_id"
    t.integer  "category_id"
    t.integer  "category_role"
    t.integer  "order_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "departments", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "enterprise_applications", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups", force: true do |t|
    t.string   "name",       limit: 100, null: false
    t.string   "status",     limit: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "priorities", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: true do |t|
    t.string   "name",       limit: 100, null: false
    t.string   "status",     limit: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "statuses", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ticket_histories", force: true do |t|
    t.integer  "ticket_id"
    t.integer  "tech_id"
    t.integer  "status_id"
    t.integer  "priority_id"
    t.string   "comment"
    t.datetime "assigned_on"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tickets", force: true do |t|
    t.integer  "category_id"
    t.integer  "created_by"
    t.integer  "department_id"
    t.integer  "priority_id"
    t.integer  "status_id"
    t.integer  "current_tech_id"
    t.integer  "application_id"
    t.integer  "requested_by"
    t.string   "short_description"
    t.datetime "assigned_on"
    t.datetime "completed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "firstname",  limit: 100, null: false
    t.string   "lastname",   limit: 100, null: false
    t.string   "email",                  null: false
    t.integer  "group_id"
    t.integer  "role_id"
    t.string   "status",     limit: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
