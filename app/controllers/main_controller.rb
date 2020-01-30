class MainController < ApplicationController
  def home
    @properties = Property \
      .where("updated_at > ?", 48.hours.ago) \
      .where("acres > ? OR acres = -1", 1.5) \
      .where(list_price: 100000..1500000)
  end

  def all
    @properties = ZoloProperty.where("updated_at < ?", 24.hours.ago).order(created_at: :desc)
  end
end
