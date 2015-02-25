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

ActiveRecord::Schema.define(version: 20150202145028) do

  create_table "categories", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "description", limit: 255
  end

  create_table "lesson_words", force: :cascade do |t|
    t.integer  "lesson_id",      limit: 4
    t.integer  "word_id",        limit: 4
    t.integer  "word_answer_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lesson_words", ["lesson_id"], name: "index_lesson_words_on_lesson_id", using: :btree
  add_index "lesson_words", ["word_answer_id"], name: "index_lesson_words_on_word_answer_id", using: :btree
  add_index "lesson_words", ["word_id"], name: "index_lesson_words_on_word_id", using: :btree

  create_table "lessons", force: :cascade do |t|
    t.string   "result",      limit: 255
    t.integer  "user_id",     limit: 4
    t.integer  "category_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lessons", ["category_id"], name: "index_lessons_on_category_id", using: :btree
  add_index "lessons", ["user_id"], name: "index_lessons_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "email",           limit: 255
    t.string   "password_digest", limit: 255
    t.boolean  "isadmin",         limit: 1,   default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_digest", limit: 255
  end

  create_table "word_answers", force: :cascade do |t|
    t.string   "content",    limit: 255
    t.boolean  "correct",    limit: 1
    t.integer  "word_id",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "word_answers", ["word_id"], name: "index_word_answers_on_word_id", using: :btree

  create_table "words", force: :cascade do |t|
    t.string   "content",     limit: 255
    t.integer  "category_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "words", ["category_id"], name: "index_words_on_category_id", using: :btree

end
