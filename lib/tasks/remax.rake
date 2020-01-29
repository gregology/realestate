namespace :remax do
  desc "Extract properties from Remax"
  task :extract => :environment do
    include ApplicationHelper

    search_locations.each do |search_location|
      properties = get_remax_properties(search_location[:north], search_location[:east], search_location[:south], search_location[:west])
      
      properties.each do |property|
        puts property
        property_array = property.split(';')

        remax_property = RemaxProperty.find_or_create_by(id: property_array[2].to_i)
        remax_property.update(
          latitude: property_array[0],
          longitude: property_array[1],
          list_price: property_array[3],
          list_date: property_array[4],
        )

      end
      sleep rand(3..7)
    end
  end

  desc "Extract properties from Remax"
  task :update => :environment do
    include ApplicationHelper

    if rand() > 0.3
      remax_properties = RemaxProperty.where(address: nil).where.not(id: 0).limit(rand(3..8))
      unless remax_properties.empty?
        property_ids = remax_properties.map(&:id)
        properties = get_detailed_remax_properties(property_ids)

        properties.each do |property|
          puts property

          remax_property = RemaxProperty.find(property['listingId'].to_i)
          remax_property.update(
            address:               property['address'],
            city:                  property['city'],
            baths:                 property['baths'],
            full_baths:            property['fullBaths'],
            half_baths:            property['halfBaths'],
            bed:                   property['beds'],
            detail_url:            property['detailUrl'],
            mls_num:               property['mlsNum'],
            postal_code:           property['postalCode'],
            primary_business_type: property['primaryBusinessType'],
            list_price:            property['listPrice'],
            lot_size:              property['lotSizeSearch'],
            is_luxury:             property['isLuxury'],
            is_commercial:         property['isCommercial'],
            is_remax_listing:      property['isRemaxListing'],
            images:                property['imageUrls'],
          )
        end

        not_updated = RemaxProperty.where(address: nil).where(id: property_ids)
        not_updated.destroy unless not_updated.empty?
      end
    end
  end

  desc "Extract lots of properties from Remax"
  task :update_lots => :environment do
    include ApplicationHelper

    10.times do
      remax_properties = RemaxProperty.where(address: nil).where.not(id: 0).limit(rand(5..8))
      property_ids = remax_properties.map(&:id)
      properties = get_detailed_remax_properties(property_ids)

      properties.each do |property|
        puts property

        remax_property = RemaxProperty.find(property['listingId'].to_i)
        remax_property.update(
          address:               property['address'],
          city:                  property['city'],
          baths:                 property['baths'],
          full_baths:            property['fullBaths'],
          half_baths:            property['halfBaths'],
          bed:                   property['beds'],
          detail_url:            property['detailUrl'],
          mls_num:               property['mlsNum'],
          postal_code:           property['postalCode'],
          primary_business_type: property['primaryBusinessType'],
          list_price:            property['listPrice'],
          lot_size:              property['lotSizeSearch'],
          is_luxury:             property['isLuxury'],
          is_commercial:         property['isCommercial'],
          is_remax_listing:      property['isRemaxListing'],
          images:                property['imageUrls'],
        )
      end

      not_updated = RemaxProperty.where(address: nil).where(id: property_ids)
      not_updated.destroy unless not_updated.empty?
      sleep rand(3..7)
    end
  end
end