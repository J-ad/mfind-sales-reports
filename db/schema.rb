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

ActiveRecord::Schema.define(version: 20161004152030) do

  create_table "actions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "service_type"
    t.integer  "template_id"
    t.integer  "event_id"
    t.string   "timeframe"
    t.string   "strategy"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["event_id"], name: "fk_rails_ff814373b0", using: :btree
    t.index ["template_id"], name: "fk_rails_8ba38c6612", using: :btree
  end

  create_table "events", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "status"
    t.string   "timeframe"
    t.integer  "attempts"
    t.integer  "schema_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["schema_id"], name: "fk_rails_97290a77fb", using: :btree
  end

  create_table "fetch_numbers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "soql_where", limit: 65535
    t.string   "set_status"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "leads", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "salesforce_lead_id"
    t.integer  "phone"
    t.string   "email"
    t.string   "salesforce_status"
    t.integer  "attempts_counter"
    t.string   "score"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.boolean  "sync_with_sf"
    t.string   "thulium_status"
    t.integer  "call_id"
    t.integer  "owner_id"
    t.index ["owner_id"], name: "index_leads_on_owner_id", using: :btree
    t.index ["salesforce_lead_id"], name: "index_leads_on_salesforce_lead_id", using: :btree
  end

  create_table "notifications", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "description"
    t.datetime "sent_at"
    t.integer  "lead_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "template_id"
    t.index ["lead_id"], name: "index_notifications_on_lead_id", using: :btree
    t.index ["template_id"], name: "index_notifications_on_template_id", using: :btree
  end

  create_table "owners", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "salesforce_id"
    t.string   "email"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "partners", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sales_reports", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "partner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["partner_id"], name: "index_sales_reports_on_partner_id", using: :btree
  end

  create_table "schemas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "valid_from"
    t.datetime "valid_to"
    t.string   "queue_id"
    t.boolean  "enabled"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "tod"
    t.integer  "fetch_number_id"
    t.string   "description"
    t.index ["fetch_number_id"], name: "fk_rails_0e0fe81aff", using: :btree
  end

  create_table "templates", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.text     "body",                   limit: 65535
    t.string   "additional_information"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_foreign_key "actions", "events"
  add_foreign_key "actions", "templates"
  add_foreign_key "events", "schemas"
  add_foreign_key "leads", "owners"
  add_foreign_key "notifications", "leads"
  add_foreign_key "notifications", "templates"
  add_foreign_key "sales_reports", "partners"
  add_foreign_key "schemas", "fetch_numbers"
end
