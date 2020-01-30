namespace :purple_bricks do

  desc "Extract properties from Purple Bricks"
  task :extract => :environment do
    include ApplicationHelper

    search_locations.each do |search_location|
      properties = get_purple_bricks_properties(search_location[:north], search_location[:east], search_location[:south], search_location[:west])
      
      properties.each do |property|
        puts property

        purple_bricks_property = PurpleBricksProperty.find_or_create_by(purple_bricks_id: property['id'])
        purple_bricks_property.update(
          latitude: property['latitude'],
          longitude: property['longitude'],
          is_builder: !property['is_builder'].zero?,
          is_rental: !property['is_rental'].zero?,
          is_new: !property['is_new'].zero?,
          is_sold: !property['is_sold'].zero?,
        )

      end
      sleep rand(3..7)
    end
  end

  desc "Update properties from Purple Bricks"
  task :update => :environment do
    include ApplicationHelper

    purple_bricks_properties = PurpleBricksProperty.where(address: nil, is_sold: false).limit(rand(17..23))

    purple_bricks_properties.each do |property|
      update_purple_bricks_property(property)
      sleep rand(3..7)
    end
  end

  desc "Update lots of properties from Purple Bricks"
  task :update_lots => :environment do
    include ApplicationHelper

    purple_bricks_properties = PurpleBricksProperty.where(address: nil, is_sold: false).limit(rand(73..99))

    purple_bricks_properties.each do |property|
      update_purple_bricks_property(property)
      sleep rand(3..7)
    end
  end
end