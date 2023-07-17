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

ActiveRecord::Schema[7.0].define(version: 2023_07_17_215134) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dreams", force: :cascade do |t|
    t.string "title"
    t.string "content"
    t.string "drawing"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_dreams_on_user_id"
  end

  create_table "dreams_keywords", id: false, force: :cascade do |t|
    t.bigint "dream_id", null: false
    t.bigint "keyword_id", null: false
    t.index ["dream_id", "keyword_id"], name: "index_dreams_keywords_on_dream_id_and_keyword_id", unique: true
    t.index ["dream_id"], name: "index_dreams_keywords_on_dream_id"
    t.index ["keyword_id"], name: "index_dreams_keywords_on_keyword_id"
  end

  create_table "keywords", force: :cascade do |t|
    t.string "word"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "dreams", "users"
  add_foreign_key "dreams_keywords", "dreams"
  add_foreign_key "dreams_keywords", "keywords"
end
