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

ActiveRecord::Schema[7.2].define(version: 2025_06_14_203734) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "course_terms", force: :cascade do |t|
    t.bigint "course_id", null: false
    t.bigint "term_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_course_terms_on_course_id"
    t.index ["term_id"], name: "index_course_terms_on_term_id"
  end

  create_table "courses", force: :cascade do |t|
    t.bigint "school_id", null: false
    t.string "name", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_id"], name: "index_courses_on_school_id"
  end

  create_table "licenses", force: :cascade do |t|
    t.string "code", null: false
    t.bigint "term_id", null: false
    t.bigint "redeemed_by_student_id"
    t.datetime "redeemed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_licenses_on_code", unique: true
    t.index ["redeemed_by_student_id"], name: "index_licenses_on_redeemed_by_student_id"
    t.index ["term_id"], name: "index_licenses_on_term_id"
  end

  create_table "payments", force: :cascade do |t|
    t.string "method", null: false
    t.bigint "license_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "cc_number"
    t.index ["license_id"], name: "index_payments_on_license_id"
  end

  create_table "registrations", force: :cascade do |t|
    t.bigint "student_id", null: false
    t.string "registrationable_type", null: false
    t.bigint "registrationable_id", null: false
    t.bigint "payment_id"
    t.datetime "registered_at", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "active", default: true, null: false
    t.index ["payment_id"], name: "index_registrations_on_payment_id"
    t.index ["registrationable_type", "registrationable_id"], name: "idx_on_registrationable_type_registrationable_id_393bd098e0"
    t.index ["student_id"], name: "index_registrations_on_student_id"
  end

  create_table "school_admins", force: :cascade do |t|
    t.bigint "school_id", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["school_id"], name: "index_school_admins_on_school_id"
    t.index ["user_id"], name: "index_school_admins_on_user_id"
  end

  create_table "schools", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.bigint "school_id", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["school_id"], name: "index_students_on_school_id"
    t.index ["user_id"], name: "index_students_on_user_id"
  end

  create_table "terms", force: :cascade do |t|
    t.bigint "school_id", null: false
    t.string "name", null: false
    t.date "start_date", null: false
    t.date "end_date", null: false
    t.boolean "active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_id"], name: "index_terms_on_school_id"
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

  add_foreign_key "course_terms", "courses"
  add_foreign_key "course_terms", "terms"
  add_foreign_key "courses", "schools"
  add_foreign_key "licenses", "students", column: "redeemed_by_student_id"
  add_foreign_key "licenses", "terms"
  add_foreign_key "payments", "licenses"
  add_foreign_key "registrations", "payments"
  add_foreign_key "registrations", "students"
  add_foreign_key "school_admins", "schools"
  add_foreign_key "school_admins", "users"
  add_foreign_key "students", "schools"
  add_foreign_key "students", "users"
  add_foreign_key "terms", "schools"
end
