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

ActiveRecord::Schema.define(version: 2020_04_14_224116) do

  create_table "companies", force: :cascade do |t|
    t.string "user_name"
    t.string "company_name"
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "price"
  end

  create_table "van_services", force: :cascade do |t|
    t.integer "van_id"
    t.integer "service_id"
    t.index ["service_id"], name: "index_van_services_on_service_id"
    t.index ["van_id"], name: "index_van_services_on_van_id"
  end

  create_table "vans", force: :cascade do |t|
    t.string "nick_name"
    t.integer "year"
    t.string "make"
    t.string "model"
    t.integer "mileage"
    t.integer "company_id"
    t.index ["company_id"], name: "index_vans_on_company_id"
  end

  add_foreign_key "van_services", "services"
  add_foreign_key "van_services", "vans"
  add_foreign_key "vans", "companies"
end
