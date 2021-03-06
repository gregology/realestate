module ApplicationHelper

  def search_locations
    [
      {
        north: 44.236022123456789,
        east: -76.936967123456789,
        south: 44.102204123456789,
        west: -77.183857123456789,
      },
      {
        north: 44.102204123456789,
        east: -76.936967123456789,
        south: 43.967315123456789,
        west: -77.183857123456789,
      },
      {
        north: 44.155676123456789,
        east: -76.718551123456789,
        south: 44.021683123456789,
        west: -76.964087123456789,
      },
      {
        north: 44.011917123456789,
        east: -76.790556123456789,
        south: 43.878580123456789,
        west: -77.035962123456789,
      },
      {
        north: 43.956126123456789,
        east: -77.012084123456789,
        south: 43.822429123456789,
        west: -77.258336123456789,
      },
      {
        north: 44.014269123456789,
        east: -77.224205123456789,
        south: 43.880141123456789,
        west: -77.469080123456789,
      },
      {
        north: 44.049324123456789,
        east: -77.412264123456789,
        south: 43.915230123456789,
        west: -77.657535123456789,
      },
      {
        north: 44.094456123456789,
        east: -77.563503123456789,
        south: 43.960322123456789,
        west: -77.809983123456789,
      },
      {
        north: 44.167818123456789,
        east: -77.365575123456789,
        south: 44.034471123456789,
        west: -77.612480123456789,
      },
      {
        north: 44.198371123456789,
        east: -77.150777123456789,
        south: 44.064414123456789,
        west: -77.396423123456789,
      },
      {
        north: 44.153301123456789, 
        east: -77.158801123456789,
        south: 44.084824123456789,
        west: -77.329805123456789,
      },
      {
        north: 44.34534848445401,
        east: -77.95220485172163,
        south: 44.07019606283501,
        west: -78.34809678477008,
      },
      {
        north: 44.667446807001056,
        east: -78.2164178111158,
        south: 44.26754058807953,
        west: -78.79436280441018,
      },
      {
        north: 44.907503673775466,
        east: -76.06567146705066,
        south: 44.38916616461435,
        west: -76.81710840508332,
      },
      {
        north: 44.20583851319847,
        east: -76.74233693712713,
        south: 43.890536685376105,
        west: -77.19477257498954,
      },
      {
        north: 44.20013295360528,
        east: -77.17512698697287,
        south: 43.88480067445039,
        west: -77.62756262483528,
      },
      {
        north: 44.578426640914046,
        east: -76.12929742241337,
        south: 44.043859274557605,
        west: -76.8997974635242,
      },
      {
        north: 44.2191244490368,
        east: -76.99755970328421,
        south: 44.063746819043416,
        west: -77.22086675710382,
      },
      {
        north: 44.29883677998191,
        east: -77.1955785142885,
        south: 44.069516110273895,
        west: -77.52539491057915,
      },
      {
        north: 44.18782062018684,
        east: -77.50498881988233,
        south: 43.95806768708425,
        west: -77.83480521617297,
      },
      {
        north: 44.475367366113716,
        east: -77.45217817499187,
        south: 44.132669906918096,
        west: -77.9460630190622,
      },
      {
        north: 44.788337945459574,
        east: -78.73850744453247,
        south: 44.48988745278416,
        west: -79.17110119446909,
      },
      {
        north: 44.77809603726399,
        east: -79.13291258656258,
        south: 44.479592731775455,
        west: -79.56550633649921,
      },
      {
        north: 44.981661367009394,
        east: -79.60959947562635,
        south: 44.59199618345059,
        west: -80.17585061487978,
      },
    ]
  end

  def get_remax_properties(north, east, south, west)

    headers =     {
      'authority': 'api.remax.ca',
      'pragma': 'no-cache',
      'cache-control': 'no-cache',
      'accept': 'application/json, text/plain, */*',
      'sec-fetch-dest': 'empty',
      'user-agent': ENV['USER_AGENT'],
      'dnt': '1',
      'origin': 'https://www.remax.ca',
      'sec-fetch-site': 'same-site',
      'sec-fetch-mode': 'cors',
      'referer': 'https://www.remax.ca/find-real-estate',
      'accept-language': 'en-US,en;q=0.9',
      'cookie': ENV['REMAX_COOKIE']
    }

    url = "https://api.remax.ca/api/v1/listings/active?zoom=10&north=#{north}&east=#{east}&south=#{south}&west=#{west}&features.excludedListingTypeIds=101&features.excludedListingTypeIds=107&features.excludedListingTypeIds=108&features.excludedListingTypeIds=112&isPhysicalLocationSearch=true&includeSortFields=true"

    response = HTTParty.get(url, headers: headers, timeout: 180)
    results = JSON.parse response.body
    results['result']['results']
  end

  def get_detailed_remax_properties(property_ids)
    headers = {
      'authority': 'api.remax.ca',
      'pragma': 'no-cache',
      'cache-control': 'no-cache',
      'accept': 'application/json, text/plain, */*',
      'dnt': '1',
      'sec-fetch-dest': 'empty',
      'user-agent': ENV['USER_AGENT'],
      'sec-fetch-site': 'same-site',
      'sec-fetch-mode': 'cors',
      'referer': 'https://www.remax.ca/find-real-estate',
      'accept-language': 'en-US,en;q=0.9',
      'cookie': ENV['REMAX_DETAILED_COOKIE']
    }

    url = "https://www.remax.ca/api/v1/listings/previews/#{property_ids.join(',')}?includeOffice=false"

    response = HTTParty.get(url, headers: headers, timeout: 180)
    results = JSON.parse response.body
    results['result']['results']
  end

  def get_zolo_properties(north, east, south, west)
    min = 100000
    max = 4000000

    headers = {
      'sec-fetch-mode': 'cors',
      'origin': 'https://www.zolo.ca',
      'accept-encoding': 'json',
      'accept-language': 'en-US,en;q=0.9',
      'user-agent': ENV['USER_AGENT'],
      'content-type': 'application/x-www-form-urlencoded',
      'accept': '*/*',
      'referer': "https://www.zolo.ca/map-search?sarea=&min_price=#{min}&max_price=#{max}&filter=1",
      'authority': 'www.zolo.ca',
      'cookie': ENV['ZOLO_COOKIE'],
      'sec-fetch-site': 'same-origin',
    }

    body = "vw=1680&viewport=((#{south}, #{west}), (#{north},#{east}))&ne=(#{north},#{east})&sw=(#{south},#{west})&mnp=#{min}&mxp=#{max}&b=0&baths=0&mnsqft=0&ptc=0&pth=0&ptt=0&doz=0&hp=0&s_r=1&openhouse_search=0&tpid=0&sarea=,%20on,%20canada"

    response = HTTParty.post('https://www.zolo.ca/gallery_map_json.php', body: body, headers: headers, timeout: 180)
    JSON.parse response.body
  end

  def get_purple_bricks_properties(north, east, south, west)
    headers = {
      'authority': 'purplebricks.ca',
      'pragma': 'no-cache',
      'cache-control': 'no-cache',
      'accept': '*/*',
      'x-requested-with': 'XMLHttpRequest',
      'user-agent': ENV['USER_AGENT'],
      'sec-fetch-site': 'same-origin',
      'sec-fetch-mode': 'cors',
      'referer': "https://purplebricks.ca/on/search/map?position=#{((north + south) / 2).round(14)},#{((east + west) / 2).round(14)}&zoom=15",
      # 'accept-encoding': 'gzip, deflate, br',
      'accept-language': 'en-US,en;q=0.9',
      'cookie': ENV['PURPLE_BRICKS_COOKIE']
    }

    url = "https://purplebricks.ca/on/api-proxy/map-search?province=4&page%5Bsize%5D=11&include=builders&min_latitude=#{south.round(14)}&min_longitude=#{west.round(14)}&max_latitude=#{north.round(14)}&max_longitude=#{east.round(14)}&search_scope=in"

    response = HTTParty.get(url, headers: headers, timeout: 180)
    results = JSON.parse response.body
    results['data']
  end

  def update_purple_bricks_property(purple_bricks_property)
    headers = {
      'authority': 'purplebricks.ca',
      'accept': '*/*',
      'x-requested-with': 'XMLHttpRequest',
      'user-agent': ENV['USER_AGENT'], 
      'sec-fetch-site': 'same-origin',
      'sec-fetch-mode': 'cors',
      'referer': "https://purplebricks.ca/on/search/map?position=#{purple_bricks_property.lat},#{purple_bricks_property.lon}&zoom=15",
      # 'accept-encoding': 'gzip, deflate, br',
      'accept-language': 'en-US,en;q=0.9',
      'cookie': ENV['PURPLE_BRICKS_DETAILED_COOKIE']
    }

    url = "https://purplebricks.ca/on/api-proxy/listing-light/#{purple_bricks_property.purple_bricks_id}"
    response = HTTParty.get(url, headers: headers, timeout: 180)

    if response.code == 200
      results = (JSON.parse response.body).first

      purple_bricks_property.update(
        address:      results['address']['street'] || 'unknown',
        city:         results['address']['city'],
        list_price:   results['price']['raw'],
        postal_code:  results['address']['postal_code'],
        photo_url:    "https://pic.purplebricks.ca/#{results['photo_primary']['uri_1024']}",
        land_type:    results['type']
      )
    else
      purple_bricks_property.update(is_sold: true)
    end
  end

  def kml_points_to_postgres_query(kml_points)
    """
    example points from kml file
    '-77.15278689223894,43.81692450051234,89.98661798035366 -76.76414973513963,43.9311656223183,91.63299022702016 -76.84638640240468,44.12706534128443,94.04178605951739 -77.15278689223894,43.81692450051234,89.98661798035366' 
    """
    points = kml_points.split(' ').map { |l| l.split(',')[0..1]}
    points.map { |l| l.join(' ')}.join(',')
    "ST_MakePolygon( ST_GeomFromText('LINESTRING(#{points.map { |l| l.join(' ')}.join(',')})'))"
  end

  def get_prelist_properties(north, east, south, west)
    headers = {
      'authority': 'www.prelist.org',
      'pragma': 'no-cache',
      'cache-control': 'no-cache',
      'accept': 'application/json, text/javascript, */*; q=0.01',
      'dnt': '1',
      'x-csrf-token': '2oK2lKeW3KUY/ZbiNcBpALVPn/IxipdDcdEeNSSoNEdoBe/EWaY8Whu7ag4v41yxjUqSHJ15wwIZxNhDlV0Esg==',
      'x-requested-with': 'XMLHttpRequest',
      'user-agent': ENV['USER_AGENT'],
      'sec-fetch-site': 'same-origin',
      'sec-fetch-mode': 'cors',
      'referer': "https://www.prelist.org/properties/search?utf8=%E2%9C%93&location=&open_save_search=&sw_lat=#{south.round(14)}&sw_long=#{west.round(14)}&ne_lat=#{north.round(14)}&ne_long=#{east.round(14)}",
      # 'accept-encoding': 'gzip, deflate, br',
      'accept-language': 'en-US,en;q=0.9',
      'cookie': ENV['PRELIST_COOKIE']
    }

    url = "https://www.prelist.org/properties/search-results?locale=en&sw_lat=#{south.round(14)}&sw_long=#{west.round(14)}&ne_lat=#{north.round(14)}&ne_long=#{east.round(14)}&min_price=&max_price=&property_type=&beds=&for_sale_by=&rental=&keywords=&open_save_search=true&open_saved_searches=false&email_alerts=true"

    response = HTTParty.get(url, headers: headers, timeout: 180)
    results = JSON.parse response.body
    results['locations']
  end

  def update_prelist_property(prelist_property)
    url = "https://www.prelist.org/properties/#{prelist_property.id}"
    response = HTTParty.get(url, headers: {'user-agent': ENV['USER_AGENT']}, timeout: 180)
    results = response.body

    document = Nokogiri::HTML(results)

    property_details = {}

    property_details['list_price'] = document.xpath("//*[@class=\"price\"]").text.tr('^0-9', '')
    details = document.at_css('[id="details"]')

    property_details['photo_url'] = document.xpath("//*[@class=\"img-box\"]").first['style'][/\((.*?)\)/m, 1]

    details.children.each_with_index do | element, idx |
      property_details['address'] = details.children[idx + 1].text.strip if element.text.include?('Address')
      property_details['bedrooms'] = details.children[idx + 1].text.strip if element.text.include?('Bedrooms')
      property_details['bathrooms'] = details.children[idx + 1].text.strip if element.text.include?('Bathrooms')
      property_details['lot_size'] = details.children[idx + 1].text.tr('^0-9', '') if element.text.include?('Lot area')
    end
    prelist_property.update(
      address:    property_details['address'],
      beds:       property_details['bedrooms'],
      baths:      property_details['bathrooms'],
      photo_url:  property_details['photo_url'],
      list_price: property_details['list_price'],
      lot_size:   property_details['lot_size']
    )
  end
end
