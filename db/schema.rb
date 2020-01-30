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

ActiveRecord::Schema.define(version: 2020_01_30_003104) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "purple_bricks_properties", force: :cascade do |t|
    t.string "purple_bricks_id"
    t.string "address"
    t.string "city"
    t.string "postal_code"
    t.string "land_type"
    t.string "photo_url"
    t.string "listing_url"
    t.float "list_price"
    t.jsonb "price_history", default: {}, null: false
    t.boolean "is_rental"
    t.boolean "is_builder"
    t.boolean "is_new"
    t.boolean "is_sold"
    t.geography "location", limit: {:srid=>4326, :type=>"st_point", :geographic=>true}
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "regions", force: :cascade do |t|
    t.string "title"
    t.geography "area", limit: {:srid=>4326, :type=>"st_polygon", :geographic=>true}
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

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
    t.float "list_price"
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
      WITH lms_properties AS (
           SELECT zp.id,
              zp.title,
              zp.photo_url,
              zp.created_at,
              zp.updated_at,
              zp.location,
              zp.price_history,
              zp.list_price,
              zp.listing_url,
              round(((rp.lot_size / (43560.0)::double precision))::numeric, 2) AS acres
             FROM ((zolo_properties zp
               JOIN remax_properties rp ON ((st_distance(zp.location, rp.location) < (25)::double precision)))
               JOIN regions r ON ((st_intersects(zp.location, r.area) AND ((r.title)::text = 'prince_edward_county_coast'::text))))
          ), purple_bricks_properties AS (
           SELECT pbp.id,
              pbp.address AS title,
              pbp.photo_url,
              pbp.created_at,
              pbp.updated_at,
              pbp.location,
              pbp.price_history,
              pbp.list_price,
              'https://purplebricks.ca'::text AS listing_url,
              '-1'::integer AS acres
             FROM ((public.purple_bricks_properties pbp
               LEFT JOIN zolo_properties zp ON ((st_distance(zp.location, pbp.location) < (100)::double precision)))
               JOIN regions r ON ((st_intersects(pbp.location, r.area) AND ((r.title)::text = 'prince_edward_county_coast'::text))))
          ), properties AS (
           SELECT lms_properties.id,
              lms_properties.title,
              lms_properties.photo_url,
              lms_properties.created_at,
              lms_properties.updated_at,
              lms_properties.location,
              lms_properties.price_history,
              lms_properties.list_price,
              lms_properties.listing_url,
              lms_properties.acres
             FROM lms_properties
          UNION
           SELECT purple_bricks_properties.id,
              purple_bricks_properties.title,
              purple_bricks_properties.photo_url,
              purple_bricks_properties.created_at,
              purple_bricks_properties.updated_at,
              purple_bricks_properties.location,
              purple_bricks_properties.price_history,
              purple_bricks_properties.list_price,
              purple_bricks_properties.listing_url,
              purple_bricks_properties.acres
             FROM purple_bricks_properties
          )
   SELECT properties.id,
      properties.title,
      properties.photo_url,
      properties.created_at,
      properties.updated_at,
      properties.location,
      properties.price_history,
      properties.list_price,
      properties.listing_url,
      properties.acres,
      st_y(st_transform((properties.location)::geometry, 4326)) AS lat,
      st_x(st_transform((properties.location)::geometry, 4326)) AS lon,
      (st_y(st_transform((properties.location)::geometry, 3857)) + (400)::double precision) AS bbox_3857_north,
      (st_x(st_transform((properties.location)::geometry, 3857)) + (400)::double precision) AS bbox_3857_east,
      (st_y(st_transform((properties.location)::geometry, 3857)) - (400)::double precision) AS bbox_3857_south,
      (st_x(st_transform((properties.location)::geometry, 3857)) - (400)::double precision) AS bbox_3857_west
     FROM properties
    ORDER BY (properties.acres <> ('-1'::integer)::numeric) DESC NULLS LAST, properties.created_at DESC;
  SQL
end
