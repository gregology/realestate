WITH
  lms_properties AS (
    SELECT
      zp.id,
      zp.title,
      zp.photo_url,
      zp.created_at,
      zp.updated_at,
      zp.location,
      zp.price_history,
      zp.list_price,
      zp.listing_url AS listing_url,
      ROUND((rp.lot_size / 43560.0)::numeric,2) AS acres
    FROM
      zolo_properties zp
      JOIN remax_properties rp ON ST_Distance(zp.location, rp.location) < 25
      JOIN regions r ON ST_Intersects(zp.location, r.area) AND r.title = 'prince_edward_county_coast'
    ),
  purple_bricks_properties AS (
    SELECT
      pbp.id,
      pbp.address AS title,
      pbp.photo_url,
      pbp.created_at,
      pbp.updated_at,
      pbp.location,
      pbp.price_history,
      pbp.list_price,
      'https://purplebricks.ca' AS listing_url,
      -1 AS acres
    FROM
      purple_bricks_properties pbp
      LEFT JOIN zolo_properties zp ON ST_Distance(zp.location, pbp.location) < 100
      JOIN regions r ON ST_Intersects(pbp.location, r.area) AND r.title = 'prince_edward_county_coast'
    WHERE
      pbp.city NOT IN ('Cherry Valley')
      AND pbp.land_type NOT IN ('Multiplex property', 'Condominium')
  ),
  prelist_properties AS (
    SELECT
      p.id,
      p.address AS title,
      p.photo_url,
      p.created_at,
      p.updated_at,
      p.location,
      p.price_history,
      p.list_price,
      CONCAT('https://www.prelist.org/properties/', p.id) AS listing_url,
      -1 AS acres
    FROM
      prelist_properties p
      LEFT JOIN zolo_properties zp ON ST_Distance(zp.location, p.location) < 100
      JOIN regions r ON ST_Intersects(p.location, r.area) AND r.title = 'prince_edward_county_coast'
  ),
  properties AS (
    SELECT *
    FROM lms_properties
    UNION
    SELECT *
    FROM purple_bricks_properties
    UNION
    SELECT *
    FROM prelist_properties
  )
SELECT
  id,
  title,
  photo_url,
  created_at,
  updated_at,
  location,
  price_history,
  list_price,
  listing_url,
  acres,
  ST_Y(ST_Transform(CAST(location AS GEOMETRY), 4326)) AS lat,
  ST_X(ST_Transform(CAST(location AS GEOMETRY), 4326)) AS lon,
  ST_Y(ST_Transform(CAST(location AS GEOMETRY), 3857)) + 400 AS bbox_3857_north,
  ST_X(ST_Transform(CAST(location AS GEOMETRY), 3857)) + 400 AS bbox_3857_east,
  ST_Y(ST_Transform(CAST(location AS GEOMETRY), 3857)) - 400 AS bbox_3857_south,
  ST_X(ST_Transform(CAST(location AS GEOMETRY), 3857)) - 400 AS bbox_3857_west
FROM properties
ORDER BY acres != -1 DESC NULLS LAST, created_at DESC