class Place
  attr_reader :name,
              :address,
              :rating,
              :ratings_total
  
  def initialize(data)
    @name = data[:name]
    @address = data[:formatted_address]
    @rating = data[:rating]
    @ratings_total = data[:user_ratings_total]
  end
end 