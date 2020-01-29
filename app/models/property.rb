class Property < ApplicationRecord
  self.primary_key = :id

  def readonly?
    true
  end

  def map_url
    "https://maps.thecounty.ca/pecountyext/rest/services/PEC_PublicViewerDynamic/MapServer/export?dpi=96&transparent=true&format=png8&layers=show%3A9%2C11&dynamicLayers=%5B%7B%22id%22%3A9%2C%22name%22%3A%22Watercourse%20(EP%20Zone%20applies%2015%20m%20on%20either%20side)%22%2C%22source%22%3A%7B%22type%22%3A%22mapLayer%22%2C%22mapLayerId%22%3A9%7D%2C%22minScale%22%3A72223.819286%2C%22maxScale%22%3A0%7D%2C%7B%22id%22%3A11%2C%22name%22%3A%22Zoning%20(By-law%20No.%201816-2006)%22%2C%22source%22%3A%7B%22type%22%3A%22mapLayer%22%2C%22mapLayerId%22%3A11%7D%2C%22minScale%22%3A72225%2C%22maxScale%22%3A0%7D%5D&bbox=-#{bbox_3857_west}%2C#{bbox_3857_south}%2C#{bbox_3857_east}%2C#{bbox_3857_north}&bboxSR=102100&imageSR=102100&size=888%2C664&f=image"
  end

  def price_drop
    (self.price_history.first.second || 0) - (self.list_price || 0)
  end
end
