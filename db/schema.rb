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

ActiveRecord::Schema.define(version: 2022_06_10_140215) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "climbing_performances", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "climbing_frequency", default: 0
    t.integer "climbing_experience", default: 0
    t.integer "climbing_level", default: 0
    t.string "climbing_block_color", default: "Unknown"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_climbing_performances_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.bigint "city_id"
    t.bigint "admin_id"
    t.bigint "sport_id"
    t.float "latitude"
    t.float "longitude"
    t.string "title"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_id"], name: "index_events_on_admin_id"
    t.index ["city_id"], name: "index_events_on_city_id"
    t.index ["sport_id"], name: "index_events_on_sport_id"
  end

  create_table "futsal_performances", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "futsal_frequency", default: 0
    t.integer "futsal_experience", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_futsal_performances_on_user_id"
  end

  create_table "participants", force: :cascade do |t|
    t.bigint "event_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_participants_on_event_id"
    t.index ["user_id"], name: "index_participants_on_user_id"
  end

  create_table "running_performances", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "running_frequency", default: 0
    t.integer "running_experience", default: 0
    t.integer "running_distance", default: 0
    t.integer "running_speed", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_running_performances_on_user_id"
  end

  create_table "sport_users", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "sport_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sport_id"], name: "index_sport_users_on_sport_id"
    t.index ["user_id"], name: "index_sport_users_on_user_id"
  end

  create_table "sports", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "static_pages", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "suggestions", force: :cascade do |t|
    t.string "status"
    t.boolean "coaching"
    t.bigint "partnera_id"
    t.bigint "partnerb_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["partnera_id"], name: "index_suggestions_on_partnera_id"
    t.index ["partnerb_id"], name: "index_suggestions_on_partnerb_id"
  end

  create_table "tennis_performances", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "tennis_frequency", default: 0
    t.integer "tennis_experience", default: 0
    t.string "tennis_rank"
    t.string "string"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_tennis_performances_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.text "description"
    t.datetime "birthdate"
    t.string "address"
    t.float "longitude"
    t.float "latitude"
    t.bigint "city_id"
    t.index ["city_id"], name: "index_users_on_city_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "workout_performances", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "workout_frequency", default: 0
    t.integer "workout_experience", default: 0
    t.integer "workout_benchpress_weight", default: 0
    t.integer "workout_squat_weight", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_workout_performances_on_user_id"
  end

  add_foreign_key "climbing_performances", "users"
  add_foreign_key "events", "cities"
  add_foreign_key "events", "sports"
  add_foreign_key "futsal_performances", "users"
end
