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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110515134507) do

  create_table "albums", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "safe_name"
    t.string   "flickbook_url"
    t.string   "photographer"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "headline_photo_url"
    t.string   "headline_thumbnail_32_url"
  end

# Could not dump table "photos" because of following StandardError
#   Unknown type 'bool' for column 'is_landscape'

end
