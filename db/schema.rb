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

ActiveRecord::Schema.define(version: 2021_05_06_000401) do

  create_table "critics", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "uid"
    t.string "provider"
  end

  create_table "movies", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "critic_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["critic_id"], name: "index_movies_on_critic_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "content"
    t.integer "critic_id", null: false
    t.integer "movie_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["critic_id"], name: "index_reviews_on_critic_id"
    t.index ["movie_id"], name: "index_reviews_on_movie_id"
  end

  add_foreign_key "movies", "critics"
  add_foreign_key "reviews", "critics"
  add_foreign_key "reviews", "movies"
end