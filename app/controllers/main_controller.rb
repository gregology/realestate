class MainController < ApplicationController
  def home
    @properties = Property.all
  end
end
