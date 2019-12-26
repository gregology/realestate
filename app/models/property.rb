class Property < ApplicationRecord
  attr_accessor :longitude, :latitude

  before_save :create_point
  before_save :save_price_history

  validates :latitude, numericality: { greater_than_or_equal_to: -90, less_than_or_equal_to: 90 }, unless: :location?
  validates :longitude, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }, unless: :location?

  def create_point
    self.location = self.location || RGeo::Geographic.spherical_factory(srid: 4326).point(longitude, latitude)
  end

  def save_price_history
    self.price_history[Date.today] = self.latest_list_price
  end

  def lat
    self.location.latitude if self.location
  end

  def lon
    self.location.longitude if self.location
  end

  def price_drop
    self.price_history.first.second - self.latest_list_price
  end

  def transform_point_to_3857
    # this is a really bad solution but I was getting annoyed trying to solve this with Ruby gems
    results = ActiveRecord::Base.connection.execute("""
      SELECT
        ST_Y(ST_Transform(CAST(location AS GEOMETRY), 3857)) AS lat,
        ST_X(ST_Transform(CAST(location AS GEOMETRY), 3857)) AS lon
      FROM properties
      WHERE id = #{self.id}
    """).first
  end

  def map_url
    point_in_3857 = self.transform_point_to_3857
    lat_diff = 400
    lon_diff = 400

    north = point_in_3857['lat'] + lat_diff
    south = point_in_3857['lat'] - lat_diff
    east = point_in_3857['lon']+ lon_diff
    west = point_in_3857['lon'] - lon_diff

    "https://maps.thecounty.ca/pecountyext/rest/services/PEC_PublicViewerDynamic/MapServer/export?dpi=96&transparent=true&format=png8&layers=show%3A9%2C11&dynamicLayers=%5B%7B%22id%22%3A9%2C%22name%22%3A%22Watercourse%20(EP%20Zone%20applies%2015%20m%20on%20either%20side)%22%2C%22source%22%3A%7B%22type%22%3A%22mapLayer%22%2C%22mapLayerId%22%3A9%7D%2C%22minScale%22%3A72223.819286%2C%22maxScale%22%3A0%7D%2C%7B%22id%22%3A11%2C%22name%22%3A%22Zoning%20(By-law%20No.%201816-2006)%22%2C%22source%22%3A%7B%22type%22%3A%22mapLayer%22%2C%22mapLayerId%22%3A11%7D%2C%22minScale%22%3A72225%2C%22maxScale%22%3A0%7D%5D&bbox=-#{west}%2C#{south}%2C#{east}%2C#{north}&bboxSR=102100&imageSR=102100&size=888%2C664&f=image"
  end
end
