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

ActiveRecord::Schema.define(version: 20151027084253) do

  create_table "account_teachers", force: :cascade do |t|
    t.integer  "account_id", limit: 4
    t.integer  "teacher_id", limit: 4
    t.boolean  "admin"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "account_teachers", ["account_id"], name: "index_account_teachers_on_account_id", using: :btree
  add_index "account_teachers", ["teacher_id"], name: "index_account_teachers_on_teacher_id", using: :btree

  create_table "accounts", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "email",      limit: 255
    t.integer  "phone",      limit: 4
    t.string   "address",    limit: 255
    t.integer  "owner_id",   limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "accounts_streams", id: false, force: :cascade do |t|
    t.integer "account_id", limit: 4
    t.integer "stream_id",  limit: 4
  end

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace",     limit: 255
    t.text     "body",          limit: 65535
    t.string   "resource_id",   limit: 255,   null: false
    t.string   "resource_type", limit: 255,   null: false
    t.integer  "author_id",     limit: 4
    t.string   "author_type",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "answers", force: :cascade do |t|
    t.integer  "account_id",       limit: 4
    t.integer  "student_id",       limit: 4
    t.integer  "paper_session_id", limit: 4
    t.integer  "question_id",      limit: 4
    t.string   "answer",           limit: 255
    t.boolean  "correct"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "batches", force: :cascade do |t|
    t.integer  "account_id", limit: 4
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "batches_exams", id: false, force: :cascade do |t|
    t.integer "batch_id", limit: 4
    t.integer "exam_id",  limit: 4
  end

  create_table "batches_papers", id: false, force: :cascade do |t|
    t.integer "batch_id", limit: 4
    t.integer "paper_id", limit: 4
  end

  create_table "exam_sessions", force: :cascade do |t|
    t.integer  "account_id",  limit: 4
    t.integer  "exam_id",     limit: 4
    t.integer  "student_id",  limit: 4
    t.integer  "time_taken",  limit: 4
    t.float    "max_marks",   limit: 24
    t.float    "percentage",  limit: 24
    t.float    "score",       limit: 24
    t.datetime "started_at"
    t.datetime "finished_at"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "exams", force: :cascade do |t|
    t.integer  "account_id", limit: 4
    t.string   "name",       limit: 255
    t.integer  "status",     limit: 4
    t.integer  "duration",   limit: 4
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "batch_id",   limit: 4
  end

  add_index "exams", ["batch_id"], name: "index_exams_on_batch_id", using: :btree

  create_table "exams_segments", id: false, force: :cascade do |t|
    t.integer "exam_id",    limit: 4
    t.integer "segment_id", limit: 4
  end

  create_table "paper_sessions", force: :cascade do |t|
    t.integer  "account_id",      limit: 4
    t.integer  "paper_id",        limit: 4
    t.integer  "student_id",      limit: 4
    t.integer  "exam_session_id", limit: 4
    t.integer  "time_taken",      limit: 4
    t.float    "max_marks",       limit: 24
    t.float    "percentage",      limit: 24
    t.float    "score",           limit: 24
    t.datetime "started_at"
    t.datetime "finished_at"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "exam_id",         limit: 4
  end

  add_index "paper_sessions", ["exam_id"], name: "index_paper_sessions_on_exam_id", using: :btree

  create_table "papers", force: :cascade do |t|
    t.string   "name",                        limit: 255
    t.integer  "account_id",                  limit: 4
    t.integer  "exam_id",                     limit: 4
    t.integer  "status",                      limit: 4
    t.integer  "duration",                    limit: 4
    t.float    "marks_per_question",          limit: 24
    t.float    "negative_marks_per_question", limit: 24
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  create_table "papers_questions", id: false, force: :cascade do |t|
    t.integer "paper_id",    limit: 4
    t.integer "question_id", limit: 4
  end

  create_table "papers_segments", id: false, force: :cascade do |t|
    t.integer "paper_id",   limit: 4
    t.integer "segment_id", limit: 4
  end

  create_table "papers_topics", id: false, force: :cascade do |t|
    t.integer "paper_id", limit: 4
    t.integer "topic_id", limit: 4
  end

  create_table "questions", force: :cascade do |t|
    t.integer  "account_id",     limit: 4
    t.integer  "topic_id",       limit: 4
    t.text     "title",          limit: 65535
    t.string   "option1",        limit: 255
    t.string   "option2",        limit: 255
    t.string   "option3",        limit: 255
    t.string   "option4",        limit: 255
    t.string   "option5",        limit: 255
    t.string   "answer",         limit: 255
    t.float    "marks",          limit: 24
    t.float    "negative_marks", limit: 24
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "segments", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.integer  "account_id",     limit: 4
    t.boolean  "match_all"
    t.integer  "students_count", limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "streams", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "streams_subjects", id: false, force: :cascade do |t|
    t.integer "steam_id",   limit: 4
    t.integer "subject_id", limit: 4
  end

  create_table "streams_teachers", id: false, force: :cascade do |t|
    t.integer "stream_id",  limit: 4
    t.integer "teacher_id", limit: 4
  end

  create_table "students", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "name",                   limit: 255
    t.string   "phone",                  limit: 255
    t.string   "address",                limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "current_paper_id",       limit: 4
  end

  add_index "students", ["current_paper_id"], name: "index_students_on_current_paper_id", using: :btree
  add_index "students", ["email"], name: "index_students_on_email", unique: true, using: :btree
  add_index "students", ["reset_password_token"], name: "index_students_on_reset_password_token", unique: true, using: :btree

  create_table "subjects", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "subjects_teachers", id: false, force: :cascade do |t|
    t.integer "subject_id", limit: 4
    t.integer "teacher_id", limit: 4
  end

  create_table "subscriptions", force: :cascade do |t|
    t.integer  "account_id",  limit: 4
    t.integer  "batch_id",    limit: 4
    t.integer  "student_id",  limit: 4
    t.string   "roll_number", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "teachers", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "name",                   limit: 255
    t.string   "phone",                  limit: 255
    t.string   "qualifications",         limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "teachers", ["email"], name: "index_teachers_on_email", unique: true, using: :btree
  add_index "teachers", ["reset_password_token"], name: "index_teachers_on_reset_password_token", unique: true, using: :btree

  create_table "topics", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "subject_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

end
