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

ActiveRecord::Schema.define(version: 2020_05_11_071941) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'bug_collections', force: :cascade do |t|
    t.bigint 'bug_id'
    t.bigint 'island_id'
    t.boolean 'collected'
    t.boolean 'donated'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index %w[bug_id], name: 'index_bug_collections_on_bug_id'
    t.index %w[island_id], name: 'index_bug_collections_on_island_id'
  end

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

  create_table 'islands', force: :cascade do |t|
    t.string 'player_name'
    t.string 'island_name'
    t.bigint 'user_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index %w[user_id], name: 'index_islands_on_user_id'
  end

  create_table 'months', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'users', force: :cascade do |t|
    t.string 'provider', default: 'email', null: false
    t.string 'uid', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.boolean 'allow_password_change', default: false
    t.datetime 'remember_created_at'
    t.string 'confirmation_token'
    t.datetime 'confirmed_at'
    t.datetime 'confirmation_sent_at'
    t.string 'unconfirmed_email'
    t.string 'name'
    t.string 'nickname'
    t.string 'image'
    t.string 'email'
    t.json 'tokens'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.integer 'sign_in_count', default: 0, null: false
    t.datetime 'current_sign_in_at'
    t.datetime 'last_sign_in_at'
    t.inet 'current_sign_in_ip'
    t.inet 'last_sign_in_ip'
    t.index %w[confirmation_token],
            name: 'index_users_on_confirmation_token', unique: true
    t.index %w[email], name: 'index_users_on_email', unique: true
    t.index %w[reset_password_token],
            name: 'index_users_on_reset_password_token', unique: true
    t.index %w[uid provider],
            name: 'index_users_on_uid_and_provider', unique: true
  end
end
