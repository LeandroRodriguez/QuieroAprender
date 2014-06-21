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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20140620230207) do
=======
ActiveRecord::Schema.define(version: 20140619065104) do
>>>>>>> 52442673d0a0adfeec1c072d9b6b06286815053b

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "course_students", force: true do |t|
    t.integer  "user_id"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "course_students", ["course_id"], name: "index_course_students_on_course_id"
  add_index "course_students", ["user_id"], name: "index_course_students_on_user_id"

  create_table "courses", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.float    "longitude"
    t.float    "latitude"
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "subcategory_id"
  end

  add_index "courses", ["subcategory_id"], name: "index_courses_on_subcategory_id"

  create_table "courses_tags", id: false, force: true do |t|
    t.integer "course_id"
    t.integer "tag_id"
  end

  create_table "plans", force: true do |t|
    t.string   "name"
    t.string   "type"
    t.decimal  "price"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subcategories", force: true do |t|
    t.string   "name"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags", force: true do |t|
	t.string   "name"
  end 	

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "birthdate"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
