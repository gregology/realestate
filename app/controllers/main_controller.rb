class MainController < ApplicationController
  def home
    @properties = Property \
      .where("address NOT LIKE '%south church street%'") \
      .where("address NOT LIKE '%natures lane%'") \
      .where("address NOT LIKE '%meadow view lane%'") \
      .where("address NOT LIKE '%butternut lane%'") \
      .where("address NOT LIKE '%farm view lane%'") \
      .where("address NOT LIKE '%hollow lane%'") \
      .where('ST_Distance(location, ST_SetSRID(ST_MakePoint(-77.208518, 43.820895), 4326)) < 40000') \
      .where("updated_at < ?", 36.hours.ago) \
      .order(created_at: :desc)
  end

  def all
    @properties = Property.order(created_at: :desc)
  end
end
