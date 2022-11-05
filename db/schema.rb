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

ActiveRecord::Schema[7.0].define(version: 2022_11_05_133911) do
  create_table "articles", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.datetime "discarded_at"
    t.index ["discarded_at"], name: "index_articles_on_discarded_at"
  end

  create_table "category_masters", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
    t.string "category"
    t.datetime "discarded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["discarded_at"], name: "index_category_masters_on_discarded_at"
  end

  create_table "comments", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
    t.string "commenter"
    t.text "body"
    t.bigint "article_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.datetime "discarded_at"
    t.index ["article_id"], name: "index_comments_on_article_id"
    t.index ["discarded_at"], name: "index_comments_on_discarded_at"
  end

  add_foreign_key "comments", "articles"
end
