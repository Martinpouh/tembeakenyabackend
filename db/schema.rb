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

ActiveRecord::Schema[7.0].define(version: 2022_10_14_120625) do
  create_table "flights", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "creator"
    t.string "location"
    t.string "start_date"
    t.string "end_date"
    t.string "image"
    t.integer "budget"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "passenger_schedules", force: :cascade do |t|
    t.integer "passenger_id"
    t.integer "schedule_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "passengers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "passengers_flights", force: :cascade do |t|
    t.string "method_of_transportation"
    t.integer "transportation_cost"
    t.string "accommodation_description"
    t.integer "accommodation_cost"
    t.string "commentary"
    t.integer "passenger_id"
    t.integer "flight_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schedules", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "date"
    t.string "start_time"
    t.integer "duration"
    t.integer "cost"
    t.integer "flight_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sessions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
