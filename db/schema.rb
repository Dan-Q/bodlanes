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

ActiveRecord::Schema.define(version: 20160725101629) do

  create_table "content_areas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "template_id"
    t.string   "name"
    t.integer  "width"
    t.integer  "height"
    t.string   "content_type"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "content_blocks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "content_area_id"
    t.integer  "presentation_id"
    t.string   "name"
    t.string   "content_type"
    t.text     "content",         limit: 65535
    t.boolean  "default"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.text     "timings",         limit: 65535
  end

  create_table "media_files", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "presentation_id"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "presentations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "template_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.text     "custom_css",  limit: 65535
    t.text     "plugins",     limit: 65535
  end

  create_table "screen_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "default_zoom", default: "1"
  end

  create_table "templates", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "screen_type_id"
    t.string   "name"
    t.string   "code"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

end
