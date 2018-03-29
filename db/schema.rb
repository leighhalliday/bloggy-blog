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

ActiveRecord::Schema.define(version: 20180329195347) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "upload_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "slug", null: false
    t.boolean "is_listed", default: true, null: false
  end

  create_table "idioma_phrases", id: :serial, force: :cascade do |t|
    t.string "locale"
    t.string "i18n_key"
    t.text "i18n_value"
    t.datetime "translated_at"
    t.datetime "flagged_at"
    t.text "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", id: :serial, force: :cascade do |t|
    t.string "slug", null: false
    t.string "title"
    t.string "subtitle"
    t.text "body"
    t.integer "user_id"
    t.integer "category_id"
    t.integer "upload_id"
    t.boolean "is_static", default: false, null: false
    t.string "source_url"
    t.string "source_name"
    t.string "seo_description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "published_at"
    t.text "snippet"
    t.text "summary"
    t.boolean "is_listed", default: true, null: false
    t.string "seo_tags"
    t.boolean "noindex", default: false, null: false
    t.datetime "last_modified_at"
  end

  create_table "redirects", id: :serial, force: :cascade do |t|
    t.string "from_slug", null: false
    t.string "to_path"
    t.integer "redirectable_id"
    t.string "redirectable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "settings", id: :serial, force: :cascade do |t|
    t.string "key"
    t.text "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "data_type", default: "string"
    t.string "name"
    t.text "description"
  end

  create_table "uploads", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "file_file_name"
    t.string "file_content_type"
    t.integer "file_file_size"
    t.datetime "file_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "linkedin"
    t.string "twitter"
    t.string "crypted_password", null: false
    t.string "salt", null: false
    t.string "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.integer "upload_id"
    t.string "github"
    t.text "snippet"
    t.index ["remember_me_token"], name: "index_users_on_remember_me_token"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token"
  end

end
