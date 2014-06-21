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

ActiveRecord::Schema.define(version: 20140620200915) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "lessons", force: true do |t|
    t.string   "name"
    t.string   "url"
    t.string   "access_code"
    t.datetime "expiration"
    t.integer  "limit"
    t.float    "current_avg"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "date"
  end

  add_index "lessons", ["user_id"], name: "index_lessons_on_user_id", using: :btree

  create_table "scores", force: true do |t|
    t.float    "score"
    t.integer  "lesson_id"
    t.integer  "comment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "scores", ["comment_id"], name: "index_scores_on_comment_id", using: :btree
  add_index "scores", ["lesson_id"], name: "index_scores_on_lesson_id", using: :btree

end
