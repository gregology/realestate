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
        north: 44.196975123456789,
        east: -77.982149123456789,
        south: 44.062941123456789,
        west: -77.228559123456789,
      },
    ]
  end

  def get_remax_properties(north, east, south, west)
    headers = {
      'authority': 'api.remax.ca',
      'pragma': 'no-cache',
      'cache-control': 'no-cache',
      'accept': 'application/json, text/plain, */*',
      'origin': 'https://www.remax.ca',
      'user-agent': 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.117 Mobile Safari/537.36',
      'dnt': '1',
      'sec-fetch-site': 'same-site',
      'sec-fetch-mode': 'cors',
      'referer': 'https://www.remax.ca/find-real-estate',
      'accept-encoding': 'gzip, deflate, br',
      'accept-language': 'en-US,en;q=0.9',
      'cookie': '_gcl_au=1.1.1724605652.1577324922; _ga=GA1.2.804003917.1577324922; ry_ry-r3m4xu8m_realytics=eyJpZCI6InJ5XzNGQjEzQjU0LUVDQzMtNDk3Ni05RDBELTlDMDVBODg4QjlBNSIsImNpZCI6bnVsbCwiZXhwIjoxNjA4ODYwOTI0NDUwLCJjcyI6bnVsbH0%3D; _gid=GA1.2.2011494116.1579461606; ry_ry-r3m4xu8m_so_realytics=eyJpZCI6InJ5XzNGQjEzQjU0LUVDQzMtNDk3Ni05RDBELTlDMDVBODg4QjlBNSIsImNpZCI6bnVsbCwib3JpZ2luIjp0cnVlLCJyZWYiOm51bGwsImNvbnQiOm51bGwsIm5zIjpmYWxzZX0%3D'
    }

    url = "https://api.remax.ca/api/v1/listings/active?zoom=13&north=#{north}&east=#{east}&south=#{south}&west=#{west}&features.excludedListingTypeIds=101&features.excludedListingTypeIds=107&features.excludedListingTypeIds=108&features.excludedListingTypeIds=112&isPhysicalLocationSearch=true&includeSortFields=true"

    response = HTTParty.get(url, headers: headers, timeout: 180)
    results = JSON.parse response.body
    results['result']['results']
  end

  def get_detailed_remax_properties(property_ids)
    headers = {
      'authority': 'www.remax.ca',
      'pragma': 'no-cache',
      'cache-control': 'no-cache',
      'accept': 'application/json, text/plain, */*',
      'dnt': '1',
      'user-agent': 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Mobile Safari/537.36',
      'sec-fetch-site': 'same-origin',
      'sec-fetch-mode': 'cors',
      'referer': 'https://www.remax.ca/find-real-estate',
      'accept-encoding': 'gzip, deflate, br',
      'accept-language': 'en-US,en;q=0.9',
      'cookie': '_gcl_au=1.1.1724605652.1577324922; _ga=GA1.2.804003917.1577324922; _gid=GA1.2.343319426.1577324922; ry_ry-r3m4xu8m_realytics=eyJpZCI6InJ5XzNGQjEzQjU0LUVDQzMtNDk3Ni05RDBELTlDMDVBODg4QjlBNSIsImNpZCI6bnVsbCwiZXhwIjoxNjA4ODYwOTI0NDUwLCJjcyI6bnVsbH0%3D; ry_ry-r3m4xu8m_so_realytics=eyJpZCI6InJ5XzNGQjEzQjU0LUVDQzMtNDk3Ni05RDBELTlDMDVBODg4QjlBNSIsImNpZCI6bnVsbCwib3JpZ2luIjp0cnVlLCJyZWYiOm51bGwsImNvbnQiOm51bGwsIm5zIjpmYWxzZX0%3D; _gu=8feadcb6-2b6d-4130-b9c3-bba571b95498; _gs=2.s(src%3Dhttps%3A%2F%2Fwww.google.com%2F)c%5BDesktop%2CChrome%2C232%3A791%3A76154%3A%2CMac%20OS%2C64.229.173.73%5D; hss=1; _gw=2.433618(sc~2%2Cs~q33jqj)u%5B%2C%2C%2C%2C%5Dv%5B~fngj1%2C~1%2C~0%5Da(); __uzma=7026bc7e-ecb8-d477-7524-2b19aa0668b3; __uzmb=1577324971; null=false; ll-visitor-id=93a23fdc-5a4a-4eae-8f9b-91de09af70d9; __uzmc=645672823023; __uzmd=1577325031; remaxca-user-location=%7B%22zoomLevel%22%3A14%2C%22mapOptions%22%3A%7B%22zoom%22%3A15%2C%22zoomControl%22%3Afalse%2C%22streetViewControl%22%3Afalse%2C%22fullscreenControl%22%3Afalse%2C%22mapTypeControl%22%3Afalse%7D%2C%22centerLatLng%22%3A%7B%22lat%22%3A43.95362375808543%2C%22lng%22%3A-77.36276951240023%7D%2C%22north%22%3A43.97660507001507%2C%22south%22%3A43.93063355560519%2C%22west%22%3A-77.39448395179232%2C%22east%22%3A-77.33105507300814%2C%22physicalLocation%22%3A%7B%22lat%22%3A43.95362375808543%2C%22lng%22%3A-77.36276951240023%7D%7D'
    }

    url = "https://www.remax.ca/api/v1/listings/previews/#{property_ids.join(',')}?includeOffice=false"

    response = HTTParty.get(url, headers: headers, timeout: 180)
    results = JSON.parse response.body
    results['result']['results']
  end

  def get_zolo_properties(north, east, south, west)
    min = 100000
    max = 2000000
    keyword = 'waterfront'

    headers = {
      'sec-fetch-mode': 'cors',
      'origin': 'https://www.zolo.ca',
      'accept-encoding': 'json',
      'accept-language': 'en-US,en;q=0.9',
      'user-agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36',
      'content-type': 'application/x-www-form-urlencoded',
      'accept': '*/*',
      'referer': "https://www.zolo.ca/map-search?sarea=&attribute_terms=#{keyword}&min_price=#{min}&max_price=#{max}&filter=1",
      'authority': 'www.zolo.ca',
      'cookie': '__cfduid=d09b18017ecb706d088c17f67014354f61571005271; PHPSESSID=c1f97976017b5bc65981258f1fe32d3c; BID=c2cd43a9-ee07-11e9-830b-bc764e102e1e; BSID=c2cd5adc-ee07-11e9-830b-bc764e102e1e; HREFR=none; SOT=2; _ga=GA1.2.2019973844.1571005272; _gid=GA1.2.898666776.1571005272; id-=',
      'sec-fetch-site': 'same-origin',
    }

    body = "vw=1680&viewport=((#{south}, #{west}), (#{north},#{east}))&ne=(#{north},#{east})&sw=(#{south},#{west})&mnp=#{min}&mxp=#{max}&b=0&baths=0&mnsqft=0&ptc=0&pth=0&ptt=0&doz=0&hp=0&at=#{keyword}&s_r=1&openhouse_search=0&tpid=0&sarea=,%20on,%20canada"

    response = HTTParty.post('https://www.zolo.ca/gallery_map_json.php', body: body, headers: headers, timeout: 180)
    JSON.parse response.body
  end
end