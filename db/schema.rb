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

ActiveRecord::Schema.define(version: 20160223191549) do

  create_table "answers", force: :cascade do |t|
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "internize_id"
    t.integer  "question_id"
    t.text     "content"
  end

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "username"
    t.string   "email"
    t.string   "encrypted_password"
    t.string   "reset_password_token"
    t.string   "reset_password_sent_at"
    t.string   "company_url"
    t.string   "access_token"
  end

  add_index "companies", ["email"], name: "index_companies_on_email", unique: true
  add_index "companies", ["reset_password_token"], name: "index_companies_on_reset_password_token", unique: true

  create_table "conversations", force: :cascade do |t|
    t.string   "subject"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "company_id"
  end

  create_table "internizes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "internship_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "condition"
  end

  create_table "internships", force: :cascade do |t|
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "position"
    t.integer  "stipend"
    t.integer  "duration"
    t.integer  "created_by_id"
    t.string   "location"
    t.string   "description"
  end

  create_table "involvements", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "conversation_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "messages", force: :cascade do |t|
    t.integer  "conversation_id"
    t.integer  "sender_id"
    t.text     "content"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "sender_type"
  end

  create_table "questions", force: :cascade do |t|
    t.integer  "internship_id"
    t.string   "question"
    t.text     "answer"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "username"
    t.string   "email"
    t.string   "access_token"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.integer  "profile_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "resume_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
