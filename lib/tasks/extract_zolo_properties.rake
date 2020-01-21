desc "Extract properties from Zolo"
task :extract_zolo_properties => :environment do
  include ApplicationHelper

  search_locations.each do |search_location|
    properties = get_zolo_properties(search_location[:north], search_location[:east], search_location[:south], search_location[:west])
    
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
    sleep rand(3..7)
  end
end
