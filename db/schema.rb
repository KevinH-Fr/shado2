# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_01_20_212259) do
  create_table "athletes", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "name"
    t.text "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_athletes_on_user_id"
  end

  create_table "campaigns", force: :cascade do |t|
    t.integer "athlete_id", null: false
    t.string "title"
    t.text "description"
    t.string "periodicity"
    t.decimal "subscription"
    t.decimal "target"
    t.date "start"
    t.date "end"
    t.text "thankyounote"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["athlete_id"], name: "index_campaigns_on_athlete_id"
  end

  create_table "fans", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "pseudo"
    t.text "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_fans_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.integer "athlete_id", null: false
    t.string "title"
    t.string "location"
    t.text "content"
    t.boolean "exclusif"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["athlete_id"], name: "index_posts_on_athlete_id"
  end

  create_table "sports", force: :cascade do |t|
    t.string "name"
    t.string "icon"
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
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "athletes", "users"
  add_foreign_key "campaigns", "athletes"
  add_foreign_key "fans", "users"
  add_foreign_key "posts", "athletes"
end
