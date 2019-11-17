class MainController < ApplicationController
  def home
    @properties = Property.where('ST_Distance(location, ST_SetSRID(ST_MakePoint(-77.208518, 43.820895), 4326)) < 44000').where("updated_at < ?", 1.days.ago).order(created_at: :desc)
  end
end
