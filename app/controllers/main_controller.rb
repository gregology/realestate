class MainController < ApplicationController
  def home
    @properties = Property \
      .where("updated_at > ?", 48.hours.ago) \
      .where("acres > ? OR acres = -1", 1.5) \
      .where(list_price: 150000..2000000)

    @latest_zolo          = ZoloProperty.maximum('updated_at').to_date
    @latest_remax         = RemaxProperty.maximum('updated_at').to_date
    @latest_purple_bricks = PurpleBricksProperty.maximum('updated_at').to_date
    @latest_prelist       = PrelistProperty.maximum('updated_at').to_date
  end

  def all
    @properties = ZoloProperty.where("updated_at < ?", 24.hours.ago).order(created_at: :desc)
  end
end
