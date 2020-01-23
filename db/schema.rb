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

ActiveRecord::Schema.define(version: 2020_01_23_224355) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "remax_properties", force: :cascade do |t|
    t.string "address"
    t.string "city"
    t.string "baths"
    t.string "full_baths"
    t.string "half_baths"
    t.string "bed"
    t.string "detail_url"
    t.string "mls_num"
    t.string "postal_code"
    t.string "primary_business_type"
    t.float "list_price"
    t.float "lot_size"
    t.boolean "is_luxury"
    t.boolean "is_commercial"
    t.boolean "is_remax_listing"
    t.datetime "list_date"
    t.geography "location", limit: {:srid=>4326, :type=>"st_point", :geographic=>true}
    t.jsonb "images", default: [], null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "zolo_properties", force: :cascade do |t|
    t.string "title"
    t.float "latest_list_price"
    t.jsonb "price_history", default: {}, null: false
    t.string "city"
    t.string "address"
    t.string "listing_url"
    t.string "photo_url"
    t.datetime "list_date"
    t.geography "location", limit: {:srid=>4326, :type=>"st_point", :geographic=>true}
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end


  create_view "properties", sql_definition: <<-SQL
      SELECT zp.id,
      zp.title,
      zp.photo_url,
      zp.created_at,
      zp.updated_at,
      st_y(st_transform((zp.location)::geometry, 4326)) AS lat,
      st_x(st_transform((zp.location)::geometry, 4326)) AS lon,
      (st_y(st_transform((zp.location)::geometry, 3857)) + (400)::double precision) AS bbox_3857_north,
      (st_x(st_transform((zp.location)::geometry, 3857)) + (400)::double precision) AS bbox_3857_east,
      (st_y(st_transform((zp.location)::geometry, 3857)) - (400)::double precision) AS bbox_3857_south,
      (st_x(st_transform((zp.location)::geometry, 3857)) - (400)::double precision) AS bbox_3857_west,
      zp.location,
      zp.price_history,
      zp.latest_list_price,
      zp.listing_url AS zolo_listing_url,
      round(((rp.lot_size / (43560.0)::double precision))::numeric, 2) AS acres
     FROM (zolo_properties zp
       JOIN remax_properties rp ON ((st_distance(zp.location, rp.location) < (25)::double precision)));
  SQL
end
