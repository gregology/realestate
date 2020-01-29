class MainController < ApplicationController
  def home
    @properties = Property.all
  end

  def all
    @properties = ZoloProperty.where("updated_at < ?", 24.hours.ago).order(created_at: :desc)
  end
end
