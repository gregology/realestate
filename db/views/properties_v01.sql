SELECT
  zp.id,
  zp.title,
  zp.photo_url,
  zp.created_at,
  zp.updated_at,
  ST_Y(ST_Transform(CAST(zp.location AS GEOMETRY), 4326)) AS lat,
  ST_X(ST_Transform(CAST(zp.location AS GEOMETRY), 4326)) AS lon,
  ST_Y(ST_Transform(CAST(zp.location AS GEOMETRY), 3857)) + 400 AS bbox_3857_north,
  ST_X(ST_Transform(CAST(zp.location AS GEOMETRY), 3857)) + 400 AS bbox_3857_east,
  ST_Y(ST_Transform(CAST(zp.location AS GEOMETRY), 3857)) - 400 AS bbox_3857_south,
  ST_X(ST_Transform(CAST(zp.location AS GEOMETRY), 3857)) - 400 AS bbox_3857_west,
  zp.location,
  zp.price_history,
  zp.latest_list_price,
  zp.listing_url AS zolo_listing_url,
  ROUND((rp.lot_size / 43560.0)::numeric,2) AS acres
FROM
  zolo_properties zp
  JOIN remax_properties rp ON ST_Distance(zp.location, rp.location) < 25
