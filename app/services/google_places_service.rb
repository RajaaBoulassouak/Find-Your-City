class GooglePlacesService 
  
  def initialize(data)
    @data = data
  end
  
  def get_places
    JSON.parse(places_response('maps/api/place/textsearch/json?').body, symbolize_names: true)[:results]
  end

  private

  def places_response(url)
    @response ||= conn.get(url) do |req|
      req.params['query'] = "#{@data}+point+of+interest"
      req.params['key']     = ENV['Google-Places-Key']
    end
  end
  
  def conn
    Faraday.new(:url => 'https://maps.googleapis.com') do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end
end
