# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_08_11_203747) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.string "text"
    t.integer "rating"
    t.bigint "question_id", null: false
    t.string "ownerable_type", null: false
    t.bigint "ownerable_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "choice_id"
    t.index ["choice_id"], name: "index_answers_on_choice_id"
    t.index ["ownerable_type", "ownerable_id"], name: "index_answers_on_ownerable_type_and_ownerable_id"
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "attachments", force: :cascade do |t|
    t.integer "ownerable_id"
    t.string "ownerable_type"
    t.text "attachment_data"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "attendances", force: :cascade do |t|
    t.bigint "student_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "session_id"
    t.boolean "verified", null: false
    t.float "lat"
    t.float "long"
    t.float "fr_score"
    t.string "failure_message"
    t.index ["session_id"], name: "index_attendances_on_session_id"
  end

  create_table "choices", force: :cascade do |t|
    t.bigint "question_id", null: false
    t.boolean "correct", default: false
    t.string "text"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "choice_num"
    t.index ["question_id"], name: "index_choices_on_question_id"
  end

  create_table "course_group_students", force: :cascade do |t|
    t.bigint "student_id"
    t.bigint "course_group_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "course_groups", force: :cascade do |t|
    t.bigint "course_id"
    t.bigint "group_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "course_students", force: :cascade do |t|
    t.bigint "student_id"
    t.bigint "course_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "code"
  end

  create_table "device_tokens", force: :cascade do |t|
    t.string "token"
    t.bigint "user_id", null: false
    t.string "device_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_device_tokens_on_user_id"
  end

  create_table "feed_backs", force: :cascade do |t|
    t.bigint "session_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["session_id"], name: "index_feed_backs_on_session_id"
  end

  create_table "interactive_quizzes", force: :cascade do |t|
    t.string "name"
    t.bigint "session_id", null: false
    t.datetime "ended_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["session_id"], name: "index_interactive_quizzes_on_session_id"
  end

  create_table "lecturer_course_groups", force: :cascade do |t|
    t.bigint "lecturer_id"
    t.bigint "course_group_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "lecturer_courses", force: :cascade do |t|
    t.bigint "lecturer_id"
    t.bigint "course_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "lecturers", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "text"
    t.string "ownerable_type"
    t.integer "ownerable_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "expires_at"
    t.string "question_type"
    t.boolean "is_rating", default: false
    t.boolean "is_text", default: false
    t.boolean "is_boolean", default: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.string "token"
    t.bigint "lecturer_id", null: false
    t.integer "classable_id"
    t.string "classable_type"
    t.time "duration"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "ended_at"
    t.boolean "apply_checks", default: true
    t.float "lat"
    t.float "long"
    t.text "qr_code_base64"
    t.index ["lecturer_id"], name: "index_sessions_on_lecturer_id"
    t.index ["token"], name: "index_sessions_on_token", unique: true
  end

  create_table "students", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.text "image_data"
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.string "first_name"
    t.string "last_name"
    t.integer "student_id"
    t.string "email"
    t.string "phone"
    t.json "tokens"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "sign_in_count"
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.bigint "userable_id"
    t.string "userable_type"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "choices", "questions"
  add_foreign_key "device_tokens", "users"
  add_foreign_key "feed_backs", "sessions"
  add_foreign_key "interactive_quizzes", "sessions"
  add_foreign_key "sessions", "lecturers"
end
