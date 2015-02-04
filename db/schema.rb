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

ActiveRecord::Schema.define(version: 20150204172048) do

  create_table "accounts", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "phone"
    t.string   "address"
    t.integer  "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "accounts_streams", id: false, force: :cascade do |t|
    t.integer "account_id"
    t.integer "stream_id"
  end

  create_table "accounts_teachers", id: false, force: :cascade do |t|
    t.integer "account_id"
    t.integer "teacher_id"
  end

  create_table "answers", force: :cascade do |t|
    t.integer  "account_id"
    t.integer  "student_id"
    t.integer  "paper_session_id"
    t.integer  "question_id"
    t.string   "answer"
    t.boolean  "correct"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "batches", force: :cascade do |t|
    t.integer  "account_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "batches_exams", id: false, force: :cascade do |t|
    t.integer "batch_id"
    t.integer "exam_id"
  end

  create_table "batches_papers", id: false, force: :cascade do |t|
    t.integer "batch_id"
    t.integer "paper_id"
  end

  create_table "exam_sessions", force: :cascade do |t|
    t.integer  "account_id"
    t.integer  "exam_id"
    t.integer  "student_id"
    t.integer  "time_taken"
    t.float    "max_marks"
    t.float    "percentage"
    t.float    "score"
    t.datetime "started_at"
    t.datetime "finished_at"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "exams", force: :cascade do |t|
    t.integer  "account_id"
    t.string   "name"
    t.integer  "status"
    t.integer  "duration"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exams_segments", id: false, force: :cascade do |t|
    t.integer "exam_id"
    t.integer "segment_id"
  end

  create_table "paper_sessions", force: :cascade do |t|
    t.integer  "account_id"
    t.integer  "paper_id"
    t.integer  "student_id"
    t.integer  "exam_session_id"
    t.integer  "time_taken"
    t.float    "max_marks"
    t.float    "percentage"
    t.float    "score"
    t.datetime "started_at"
    t.datetime "finished_at"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "papers", force: :cascade do |t|
    t.string   "name"
    t.integer  "account_id"
    t.integer  "exam_id"
    t.integer  "status"
    t.integer  "duration"
    t.float    "marks_per_question"
    t.float    "negative_marks_per_question"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "papers_questions", id: false, force: :cascade do |t|
    t.integer "paper_id"
    t.integer "question_id"
  end

  create_table "papers_segments", id: false, force: :cascade do |t|
    t.integer "paper_id"
    t.integer "segment_id"
  end

  create_table "papers_topics", id: false, force: :cascade do |t|
    t.integer "paper_id"
    t.integer "topic_id"
  end

  create_table "questions", force: :cascade do |t|
    t.integer  "account_id"
    t.integer  "topic_id"
    t.text     "title"
    t.string   "option1"
    t.string   "option2"
    t.string   "option3"
    t.string   "option4"
    t.string   "option5"
    t.string   "answer"
    t.float    "marks"
    t.float    "negative_marks"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "segments", force: :cascade do |t|
    t.string   "name"
    t.integer  "account_id"
    t.boolean  "match_all"
    t.integer  "students_count"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "streams", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "streams_subjects", id: false, force: :cascade do |t|
    t.integer "steam_id"
    t.integer "subject_id"
  end

  create_table "streams_teachers", id: false, force: :cascade do |t|
    t.integer "stream_id"
    t.integer "teacher_id"
  end

  create_table "students", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.integer  "phone"
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "students", ["email"], name: "index_students_on_email", unique: true
  add_index "students", ["reset_password_token"], name: "index_students_on_reset_password_token", unique: true

  create_table "subjects", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subjects_teachers", id: false, force: :cascade do |t|
    t.integer "subject_id"
    t.integer "teacher_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.integer  "account_id"
    t.integer  "batch_id"
    t.integer  "student_id"
    t.string   "roll_number"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "teachers", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.integer  "phone"
    t.string   "qualifications"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "teachers", ["email"], name: "index_teachers_on_email", unique: true
  add_index "teachers", ["reset_password_token"], name: "index_teachers_on_reset_password_token", unique: true

  create_table "topics", force: :cascade do |t|
    t.string   "name"
    t.integer  "subject_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
