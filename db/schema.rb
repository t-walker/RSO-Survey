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

ActiveRecord::Schema.define(version: 20170706001760) do

  create_table "answers", force: :cascade do |t|
    t.string   "answer"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "question_id"
  end

  create_table "answers_keywords", id: false, force: :cascade do |t|
    t.integer "answer_id",  null: false
    t.integer "keyword_id", null: false
    t.index ["answer_id", "keyword_id"], name: "index_answers_keywords_on_answer_id_and_keyword_id"
  end

  create_table "keywords", force: :cascade do |t|
    t.string   "keyword"
    t.integer  "weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "keywords_rsos", id: false, force: :cascade do |t|
    t.integer "keyword_id", null: false
    t.integer "rso_id",     null: false
    t.index ["keyword_id", "rso_id"], name: "index_keywords_rsos_on_keyword_id_and_rso_id"
  end

  create_table "officers", force: :cascade do |t|
    t.string   "first"
    t.string   "last"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "officers_rsos", id: false, force: :cascade do |t|
    t.integer "officer_id", null: false
    t.integer "rso_id",     null: false
    t.index ["officer_id", "rso_id"], name: "index_officers_rsos_on_officer_id_and_rso_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string   "question"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rsos", force: :cascade do |t|
    t.string   "name"
    t.string   "nickname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
