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

  def tiles(zoom)
    SimpleMercatorLocation.new({lat: self.lat, lon: self.lon}).zoom_at(zoom).to_tile
  end

  def tiles_url
    navtoken = 'eyJrZXkiOiJOQVZJT05JQ1NfV0VCQVBQX1AwMSIsImtleURvbWFpbiI6IndlYmFwcC5uYXZpb25pY3MuY29tIiwicmVmZXJlciI6IndlYmFwcC5uYXZpb25pY3MuY29tIiwicmFuZG9tIjoxNTgxODczODg3ODIzfQ'
    tiles = tiles(16)
    "https://backend.navionics.com/tile/16/#{tiles[0]}/#{tiles[1]}?LAYERS=config_2_60.00_0&TRANSPARENT=FALSE&UGC=TRUE&theme=0&navtoken=#{navtoken}"
  end

  def navionics
    headers = {
      'Connection': 'keep-alive',
      'Pragma': 'no-cache',
      'Cache-Control': 'no-cache',
      'Origin': 'https://webapp.navionics.com',
      'Sec-Fetch-Dest': 'image',
      'User-Agent': ENV['USER_AGENT'],
      'DNT': '1',
      'Accept': 'image/webp,image/apng,image/*,*/*;q=0.8',
      'Sec-Fetch-Site': 'same-site',
      'Sec-Fetch-Mode': 'cors',
      'Referer': 'https://webapp.navionics.com/',
      'Accept-Language': 'en-US,en;q=0.9'
    }

    url = self.tiles_url

    response = HTTParty.get(url, headers: headers, timeout: 180)
  end
end
