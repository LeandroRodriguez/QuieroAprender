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

ActiveRecord::Schema.define(version: 20140702055702) do

  create_table "advertisings", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "address"
    t.float    "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "advertisings_tags", id: false, force: true do |t|
    t.integer "advertising_id"
    t.integer "tag_id"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "consultations", force: true do |t|
    t.text     "description"
    t.integer  "user_id"
    t.integer  "course_id"
    t.datetime "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "consultations", ["course_id"], name: "index_consultations_on_course_id", using: :btree
  add_index "consultations", ["user_id"], name: "index_consultations_on_user_id", using: :btree

  create_table "course_students", force: true do |t|
    t.integer  "course_id"
    t.integer  "student_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "course_students", ["course_id"], name: "index_course_students_on_course_id", using: :btree
  add_index "course_students", ["student_id"], name: "index_course_students_on_student_id", using: :btree

  create_table "courses", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.float    "longitude"
    t.float    "latitude"
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "subcategory_id"
    t.float    "price"
  end

  add_index "courses", ["subcategory_id"], name: "index_courses_on_subcategory_id", using: :btree

  create_table "courses_tags", id: false, force: true do |t|
    t.integer "course_id"
    t.integer "tag_id"
  end

  create_table "opinions", force: true do |t|
    t.text     "description"
    t.integer  "user_id"
    t.integer  "course_id"
    t.datetime "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "opinions", ["course_id"], name: "index_opinions_on_course_id", using: :btree
  add_index "opinions", ["user_id"], name: "index_opinions_on_user_id", using: :btree

  create_table "plans", force: true do |t|
    t.string   "name"
    t.string   "type"
    t.decimal  "price",      precision: 10, scale: 0
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "students", force: true do |t|
  end

  create_table "subcategories", force: true do |t|
    t.string   "name"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teachers", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_sessions", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name",                default: "", null: false
    t.datetime "birthdate"
    t.string   "image"
    t.string   "crypted_password",                 null: false
    t.string   "password_salt",                    null: false
    t.string   "email",                            null: false
    t.string   "persistence_token",                null: false
    t.string   "single_access_token",              null: false
    t.string   "perishable_token",                 null: false
    t.integer  "login_count",         default: 0,  null: false
    t.integer  "failed_login_count",  default: 0,  null: false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "role"
  end

end
