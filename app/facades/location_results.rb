class LocationResults
  
  def initialize(location)
    @location = location
  end
  
  def places
    data = google_places_service.get_places
    data.map do |place|
      Place.new(place)
    end
  end
  
  private 
  
  def google_places_service
    GooglePlacesService.new(@location)
  end
end 