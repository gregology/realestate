class MainController < ApplicationController
  def home
    @properties = Property \
      .where("ST_Distance(location, ST_SetSRID(ST_MakePoint(-77.208518, 43.820895), 4326)) < 40000") \
      .where("updated_at > ?", 48.hours.ago) \
      .where("acres > ?", 1) \
      .where(latest_list_price: 100000..1500000) \
      .order(created_at: :desc)
  end

  def all
    @properties = ZoloProperty.where("updated_at < ?", 24.hours.ago).order(created_at: :desc)
  end
end
