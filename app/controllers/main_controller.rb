class MainController < ApplicationController
  def home
    @properties = Property.where("title NOT LIKE '%south church street%'").where('ST_Distance(location, ST_SetSRID(ST_MakePoint(-77.208518, 43.820895), 4326)) < 40000').where("updated_at < ?", 36.hours.ago).order(created_at: :desc)
  end
end
