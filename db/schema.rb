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

ActiveRecord::Schema.define(version: 2020_02_22_132412) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "profiles", force: :cascade do |t|
    t.bigint "respondent_id", null: false
    t.string "gender"
    t.string "department"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["respondent_id"], name: "index_profiles_on_respondent_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "prompt"
    t.string "type"
    t.boolean "optional", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "questions_surveys", force: :cascade do |t|
    t.integer "survey_id"
    t.integer "question_id"
    t.string "body"
    t.string "type"
  end

  create_table "respondents", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "surveys", force: :cascade do |t|
    t.bigint "respondent_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["respondent_id"], name: "index_surveys_on_respondent_id"
  end

  add_foreign_key "profiles", "respondents"
  add_foreign_key "surveys", "respondents"
end
