class Place
  attr_reader :name,
              :image,
              :address,
              :rating,
              :ratings_total
  
  def initialize(data)
    @name = data[:name]
    @image = get_image(data[:photos][0][:photo_reference])
    @address = data[:formatted_address]
    @rating = data[:rating]
    @ratings_total = data[:user_ratings_total]
  end
  
  def get_image(data)
    service = GooglePlacesService.new(data)
    service.get_image
  end
end 