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

ActiveRecord::Schema.define(version: 2020_04_24_034520) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'bugs', force: :cascade do |t|
    t.string 'name'
    t.string 'image'
    t.integer 'sell'
    t.string 'where'
    t.string 'weather'
    t.string 'rarity'
    t.time 'start_time'
    t.time 'end_time'
    t.integer 'internal_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'bugs_months', force: :cascade do |t|
    t.bigint 'bug_id'
    t.bigint 'month_id'
    t.index %w[bug_id], name: 'index_bugs_months_on_bug_id'
    t.index %w[month_id], name: 'index_bugs_months_on_month_id'
  end

  create_table 'months', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end
end
