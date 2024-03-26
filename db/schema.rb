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

ActiveRecord::Schema[7.0].define(version: 2024_03_26_110624) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "citext"
  enable_extension "plpgsql"

  create_table "boards", force: :cascade do |t|
    t.string "board_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "interviews", force: :cascade do |t|
    t.string "interview_type", null: false
    t.text "details"
    t.date "start_date"
    t.date "end_date"
    t.integer "point", default: 1, null: false
    t.bigint "job_listing_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_listing_id"], name: "index_interviews_on_job_listing_id"
  end

  create_table "job_listings", force: :cascade do |t|
    t.string "title"
    t.string "company"
    t.string "location"
    t.float "salary"
    t.integer "status", default: 0, null: false
    t.text "details"
    t.string "details_summary"
    t.bigint "applicant_id", null: false
    t.integer "total_points", default: 0, null: false
    t.bigint "board_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["applicant_id"], name: "index_job_listings_on_applicant_id"
    t.index ["board_id"], name: "index_job_listings_on_board_id"
  end

  create_table "users", force: :cascade do |t|
    t.citext "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.citext "username"
    t.string "firstname"
    t.string "lastname"
    t.integer "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "interviews", "job_listings"
  add_foreign_key "job_listings", "boards"
  add_foreign_key "job_listings", "users", column: "applicant_id"
end
