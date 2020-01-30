class ZoloProperty < ApplicationRecord
  attr_accessor :longitude, :latitude

  before_save :create_point
  before_save :save_price_history

  validates :latitude, numericality: { greater_than_or_equal_to: -90, less_than_or_equal_to: 90 }, unless: :location?
  validates :longitude, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }, unless: :location?

  def create_point
    self.location = self.location || RGeo::Geographic.spherical_factory(srid: 4326).point(longitude, latitude)
  end

  def save_price_history
    self.price_history[Date.today] = self.list_price
  end

  def lat
    self.location.latitude if self.location
  end

  def lon
    self.location.longitude if self.location
  end
end
