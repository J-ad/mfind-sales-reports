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

ActiveRecord::Schema.define(version: 20161005162249) do

  create_table "partners", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "enabled"
  end

  create_table "sales_reports", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "partner_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "written_premiums"
    t.integer  "policy_number"
    t.boolean  "renewal"
    t.string   "insurer"
    t.integer  "policy_premium"
    t.integer  "commission_percent"
    t.integer  "commission_ammount"
    t.string   "comments"
    t.string   "token"
    t.string   "registration_number"
    t.string   "calculation_token"
    t.string   "salesforce_id"
    t.index ["partner_id"], name: "index_sales_reports_on_partner_id", using: :btree
  end

  add_foreign_key "sales_reports", "partners"
end
