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

ActiveRecord::Schema.define(version: 20151207141756) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "company_addresses", force: :cascade do |t|
    t.integer "company_id", null: false
    t.string  "line_1",     null: false
    t.string  "line_2"
    t.string  "line_3"
    t.string  "city",       null: false
    t.string  "state",      null: false
    t.string  "zip",        null: false
  end

  add_index "company_addresses", ["company_id"], name: "index_company_addresses_on_company_id", using: :btree

  create_table "company_email_addresses", force: :cascade do |t|
    t.integer "company_id", null: false
    t.string  "address",    null: false
  end

  add_index "company_email_addresses", ["company_id"], name: "index_company_email_addresses_on_company_id", using: :btree

  create_table "company_phone_numbers", force: :cascade do |t|
    t.integer "company_id", null: false
    t.string  "number",     null: false
    t.string  "type",       null: false
  end

  add_index "company_phone_numbers", ["company_id"], name: "index_company_phone_numbers_on_company_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string "name", null: false
  end

  add_index "roles", ["name"], name: "index_roles_on_name", unique: true, using: :btree

  create_table "user_roles", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "role_id", null: false
  end

  add_index "user_roles", ["user_id", "role_id"], name: "index_user_roles_on_user_id_and_role_id", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string "email",           null: false
    t.string "password_digest", null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  add_foreign_key "company_addresses", "companies"
  add_foreign_key "company_email_addresses", "companies"
  add_foreign_key "company_phone_numbers", "companies"
end
