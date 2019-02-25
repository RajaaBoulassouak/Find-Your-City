class PlacesController < ApplicationController
  
  def index 
    @facade = LocationResults.new(params[:location])
  end
end