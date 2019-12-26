desc "Extract properties from Zolo"
task :extract_properties => :environment do
  search_locations = [
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

  min = 100000
  max = 1250000
  keyword = 'waterfront'

  search_locations.each do |search_location|
    north = search_location[:north]
    east = search_location[:east]
    south = search_location[:south]
    west = search_location[:west]

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
    properties = JSON.parse response.body
    properties.each do |property|
      puts property
      address = property['url_street_address'].gsub('-', ' ')
      list_price = property['list_price'].delete(',').to_f
      existing_property = ZoloProperty.find_by(address: address)
      if existing_property.nil?
        ZoloProperty.create(
          title: property['url_street_address'],
          latitude: property['lat'],
          longitude: property['lng'],
          latest_list_price: list_price,
          city: property['city'],
          address: address,
          listing_url: "https://www.zolo.ca/#{property['url_city']}-real-estate/#{property['url_street_address']}",
          photo_url: property['photo'],
          list_date: property['list_date']
        )
      else
        existing_property.update_attribute('latest_list_price', list_price)
        existing_property.save
      end
    end
  end
end
