desc "Extract properties from Remax"
task :update_remax_properties => :environment do
  include ApplicationHelper

  if rand() > 0.3
    remax_properties = RemaxProperty.where(address: nil).limit(rand(3..8))
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
