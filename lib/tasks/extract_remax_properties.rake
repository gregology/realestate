desc "Extract properties from Remax"
task :extract_remax_properties => :environment do
  include ApplicationHelper

  search_locations.each do |search_location|
    properties = get_remax_properties(search_location[:north], search_location[:east], search_location[:south], search_location[:west])
    
    properties.each do |property|
      puts property
      property_array = property.split(';')

      remax_property = RemaxProperty.find_or_create_by(id: property_array[2].to_i)
      remax_property.update(
        longitude: property_array[0],
        latitude: property_array[1],
        list_price: property_array[3],
        list_date: property_array[4],
      )

    end
    sleep rand(3..7)
  end
end
