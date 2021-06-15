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

ActiveRecord::Schema.define(version: 2021_06_15_050203) do

  create_table "administrators", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_administrators_on_email", unique: true
    t.index ["reset_password_token"], name: "index_administrators_on_reset_password_token", unique: true
  end

  create_table "answers", force: :cascade do |t|
    t.integer "post_id"
    t.integer "dog_owner_id"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cognitions", force: :cascade do |t|
    t.integer "post_id"
    t.integer "dog_owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dog_categories", force: :cascade do |t|
    t.integer "size"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dog_owners", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "last_name"
    t.string "first_name"
    t.string "nickname"
    t.string "postal_code"
    t.string "address"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "introduction"
    t.boolean "is_deleted", default: false, null: false
    t.string "image_id"
    t.index ["email"], name: "index_dog_owners_on_email", unique: true
    t.index ["reset_password_token"], name: "index_dog_owners_on_reset_password_token", unique: true
  end

  create_table "dogs", force: :cascade do |t|
    t.integer "dog_owner_id"
    t.integer "dog_category_id"
    t.string "name"
    t.integer "age"
    t.integer "gender"
    t.text "introduction"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inquiries", force: :cascade do |t|
    t.integer "administrator_id"
    t.integer "dog_owner_id"
    t.string "name"
    t.string "email"
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.integer "dog_owner_id"
    t.integer "dog_id"
    t.integer "category"
    t.string "title"
    t.text "body"
    t.string "image_id"
    t.string "keyword"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "references", force: :cascade do |t|
    t.integer "answer_id"
    t.integer "dog_owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
