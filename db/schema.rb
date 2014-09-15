# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140912133234) do

  create_table "agences", force: true do |t|
    t.string   "raison_sociale"
    t.string   "siret"
    t.string   "num_rue"
    t.string   "adresse01l01"
    t.string   "adresse01l02"
    t.string   "adresse01l03"
    t.string   "code_postal"
    t.string   "ville"
    t.string   "region"
    t.string   "pays"
    t.string   "telephone"
    t.string   "fax"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "image_file_name"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "agence_id"
    t.boolean  "admin",           default: false
  end

  add_index "users", ["agence_id"], name: "index_users_on_agence_id"

end
