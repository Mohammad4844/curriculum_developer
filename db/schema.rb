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

ActiveRecord::Schema[7.0].define(version: 2023_10_22_062100) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "course_curriculums", force: :cascade do |t|
    t.bigint "course_id", null: false
    t.bigint "curriculum_id", null: false
    t.string "level"
    t.boolean "completed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_course_curriculums_on_course_id"
    t.index ["curriculum_id"], name: "index_course_curriculums_on_curriculum_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "title"
    t.string "url"
    t.text "description"
    t.string "prereqs"
    t.integer "course_hrs_week"
    t.integer "recitation_hrs_week"
    t.string "taught_by"
    t.string "offered_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "curriculums", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "major"
    t.integer "time_frame"
    t.integer "hrs_week"
    t.string "concentration"
    t.text "reason_for_pursuing"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_curriculums_on_user_id"
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
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "course_curriculums", "courses"
  add_foreign_key "course_curriculums", "curriculums"
  add_foreign_key "curriculums", "users"
end
