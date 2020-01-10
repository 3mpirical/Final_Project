# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_01_10_013827) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "billings", force: :cascade do |t|
    t.boolean "subscription_plan"
    t.boolean "payment_processing"
    t.boolean "shopping_cart"
    t.boolean "user_marketplace"
    t.boolean "product_managment"
    t.bigint "project_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_id"], name: "index_billings_on_project_id"
  end
  
  create_table "accounts", force: :cascade do |t|
    t.boolean "email_pass"
    t.boolean "facebook"
    t.boolean "twitter"
    t.boolean "google"
    t.boolean "linkedin"
    t.boolean "github"
    t.boolean "invitation"
    t.boolean "multi_account"
    t.boolean "subdomain"
    t.boolean "custom"
    t.bigint "project_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_id"], name: "index_accounts_on_project_id"
  end

  create_table "date_locations", force: :cascade do |t|
    t.boolean "calendar"
    t.boolean "display"
    t.boolean "map_display"
    t.boolean "booking"
    t.bigint "project_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_id"], name: "index_date_locations_on_project_id"
  end

  create_table "integrations", force: :cascade do |t|
    t.boolean "third_party"
    t.boolean "messaging"
    t.boolean "api_integrate"
    t.boolean "phone_number"
    t.bigint "project_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_id"], name: "index_integrations_on_project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.integer "days"
    t.integer "total"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "securities", force: :cascade do |t|
    t.boolean "certificate"
    t.boolean "factor_authentication"
    t.string "dos_protection"
    t.bigint "project_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_id"], name: "index_securities_on_project_id"
  end

  create_table "user_contents", force: :cascade do |t|
    t.boolean "dashboard"
    t.boolean "acitivty_feed"
    t.boolean "uploading"
    t.boolean "profiles"
    t.boolean "transactional_email"
    t.boolean "tags"
    t.boolean "rating"
    t.boolean "audio_video"
    t.boolean "searching"
    t.bigint "project_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_id"], name: "index_user_contents_on_project_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "name"
    t.string "nickname"
    t.string "image"
    t.string "email"
    t.json "tokens"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "sign_in_count", default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  add_foreign_key "billings", "projects"
  add_foreign_key "accounts", "projects"
  add_foreign_key "date_locations", "projects"
  add_foreign_key "integrations", "projects"
  add_foreign_key "projects", "users"
  add_foreign_key "securities", "projects"
  add_foreign_key "user_contents", "projects"
end
