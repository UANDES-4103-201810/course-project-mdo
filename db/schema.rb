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

ActiveRecord::Schema.define(version: 20180410190644) do

  create_table "buys", force: :cascade do |t|
    t.boolean "approved"
    t.integer "promise_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["promise_id"], name: "index_buys_on_promise_id"
    t.index ["user_id"], name: "index_buys_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "funds", force: :cascade do |t|
    t.integer "money"
    t.boolean "approved"
    t.integer "project_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_funds_on_project_id"
    t.index ["user_id"], name: "index_funds_on_user_id"
  end

  create_table "projects", force: :cascade do |t|
    t.boolean "outstanding"
    t.boolean "approved"
    t.boolean "deleted"
    t.string "title"
    t.text "description"
    t.integer "amount"
    t.integer "days_to_go"
    t.string "picture"
    t.string "video"
    t.text "descriptive_page"
    t.date "delivery_date"
    t.integer "category_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_projects_on_category_id"
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "promises", force: :cascade do |t|
    t.integer "price"
    t.text "description"
    t.date "release_date"
    t.integer "quantity"
    t.integer "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_promises_on_project_id"
  end

  create_table "users", force: :cascade do |t|
    t.boolean "admin"
    t.string "password"
    t.string "email"
    t.string "address"
    t.string "name"
    t.string "last_name"
    t.string "image"
    t.date "birth_date"
    t.string "security_question"
    t.string "security_answer"
    t.datetime "last_login"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
