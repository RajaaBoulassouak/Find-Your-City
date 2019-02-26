class GooglePlacesService 
  
  def initialize(data)
    @data = data
  end
  
  def get_places
    JSON.parse(places_response('maps/api/place/textsearch/json?').body, symbolize_names: true)[:results]
  end
  
  def get_image
    image = image_response('maps/api/place/photo?').body  
  end

  private

  def places_response(url)
    @response ||= conn.get(url) do |req|
      req.params['query'] = "#{@data}+point+of+interest"
      req.params['key']     = ENV['Google-Places-Key']
    end
  end
  
  def image_response(url)
    @response ||= conn.get(url) do |req|
      req.params['maxwidth'] = 400
      req.params['photoreference'] = @data
      req.params['sensor'] = false
      req.params['key']     = ENV['Google-Places-Key']
    end
  end

  def conn
    Faraday.new(:url => 'https://maps.googleapis.com') do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end
end
