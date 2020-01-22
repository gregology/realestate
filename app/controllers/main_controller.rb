class MainController < ApplicationController
  def home
    sql = """
      SELECT
        zp.id,
        zp.title,
        zp.photo_url,
        zp.created_at,
        zp.updated_at,
        ST_Y(ST_Transform(CAST(zp.location AS GEOMETRY), 4326)) AS lat,
        ST_X(ST_Transform(CAST(zp.location AS GEOMETRY), 4326)) AS lon,
        ST_Y(ST_Transform(CAST(zp.location AS GEOMETRY), 3857)) + 400 AS north,
        ST_X(ST_Transform(CAST(zp.location AS GEOMETRY), 3857)) + 400 AS east,
        ST_Y(ST_Transform(CAST(zp.location AS GEOMETRY), 3857)) + 400 AS south,
        ST_X(ST_Transform(CAST(zp.location AS GEOMETRY), 3857)) + 400 AS west,
        zp.price_history,
        zp.latest_list_price,
        ROUND((rp.lot_size / 43560.0)::numeric,2) AS acres
      FROM
        zolo_properties zp
        JOIN remax_properties rp ON ST_Distance(zp.location, rp.location) < 10
      WHERE
        ST_Distance(zp.location, ST_SetSRID(ST_MakePoint(-77.208518, 43.820895), 4326)) < 40000
        AND zp.updated_at > NOW() - INTERVAL '24 HOURS'
        AND zp.latest_list_price BETWEEN 100000 AND 1500000
        AND lot_size > 43560
      ORDER BY zp.created_at DESC
    """

    @properties = records_array = ActiveRecord::Base.connection.execute(sql)
  end

  def all
    @properties = ZoloProperty.where("updated_at < ?", 24.hours.ago).order(created_at: :desc)
  end
end
