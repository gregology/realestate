namespace :prelist do

  desc "Extract properties from Prelist"
  task :extract => :environment do
    include ApplicationHelper

    search_locations.each do |search_location|
      properties = get_prelist_properties(search_location[:north], search_location[:east], search_location[:south], search_location[:west])
      puts "Collected #{properties.count} properties"
      
      properties.each do |property|
        prelist_property = PrelistProperty.find_or_create_by(id: property['propery_id'])

        prelist_property.update(
          latitude: property['latitude'],
          longitude: property['longitude']
        )

      end
      sleep rand(3..7)
    end
  end

  desc "Update properties from Prelist"
  task :update => :environment do
    include ApplicationHelper

    prelist_properties = PrelistProperty.where(address: nil).limit(rand(3..5))

    prelist_properties.each do |property|
      update_prelist_property(property)
      sleep rand(3..7)
    end
  end
end