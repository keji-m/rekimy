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

ActiveRecord::Schema.define(version: 2021_02_06_105640) do

  create_table "certificates", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.date "date"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_certificates_on_user_id"
  end

  create_table "histories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.date "began_at"
    t.date "ended_at"
    t.string "company"
    t.string "department"
    t.text "detail"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_histories_on_user_id"
  end

  create_table "history_skills", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "history_id"
    t.bigint "skill_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["history_id"], name: "index_history_skills_on_history_id"
    t.index ["skill_id"], name: "index_history_skills_on_skill_id"
  end

  create_table "skills", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.bigint "type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type_id"], name: "index_skills_on_type_id"
  end

  create_table "types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.text "outline"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "certificates", "users"
  add_foreign_key "histories", "users"
  add_foreign_key "history_skills", "histories"
  add_foreign_key "history_skills", "skills"
  add_foreign_key "skills", "types"
end
