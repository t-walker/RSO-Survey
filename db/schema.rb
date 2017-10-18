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

ActiveRecord::Schema.define(version: 20171018165412) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.string   "answer_title"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "question_id"
    t.integer  "position"
    t.integer  "response_id"
  end

  create_table "keywords", force: :cascade do |t|
    t.string   "keyword"
    t.integer  "weight"
    t.integer  "answer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "keywords_rsos", id: false, force: :cascade do |t|
    t.integer "keyword_id", null: false
    t.integer "rso_id",     null: false
    t.index ["keyword_id", "rso_id"], name: "index_keywords_rsos_on_keyword_id_and_rso_id", using: :btree
  end

  create_table "questions", force: :cascade do |t|
    t.string   "question_title"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "position"
  end

  create_table "responses", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rso_keywords", force: :cascade do |t|
    t.integer "rso_id"
    t.integer "keyword_id"
    t.index ["keyword_id"], name: "index_rso_keywords_on_keyword_id", using: :btree
    t.index ["rso_id"], name: "index_rso_keywords_on_rso_id", using: :btree
  end

  create_table "rsos", force: :cascade do |t|
    t.string   "name"
    t.string   "nickname"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "description"
    t.string   "website"
  end

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "rso_keywords", "keywords", on_delete: :cascade
  add_foreign_key "rso_keywords", "rsos", on_delete: :cascade
end
