class MainController < ApplicationController
  def home
    @properties = Property.where(city: 'Prince Edward County').where("updated_at < ?", 1.days.ago).order(created_at: :desc)
  end
end
