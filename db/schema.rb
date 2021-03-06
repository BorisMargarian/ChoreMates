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

ActiveRecord::Schema.define(version: 2019_06_07_175313) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chores", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.datetime "due", default: -> { "CURRENT_TIMESTAMP" }
    t.integer "cost", default: 0
    t.string "status", default: "unclaimed"
    t.string "chore_photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "house_id"
    t.bigint "user_id"
    t.index ["house_id"], name: "index_chores_on_house_id"
    t.index ["user_id"], name: "index_chores_on_user_id"
  end

  create_table "houses", force: :cascade do |t|
    t.string "name", null: false
    t.string "password", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username", null: false
    t.integer "balance", default: 0, null: false
    t.bigint "house_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["house_id"], name: "index_users_on_house_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

end
