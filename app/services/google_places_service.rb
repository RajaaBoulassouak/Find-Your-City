class GooglePlacesService 
  
  def initialize(location)
    @location = location 
  end
  
  def get_places
    results = JSON.parse(response('maps/api/place/textsearch/json?').body, symbolize_names: true)
    results[:results]
  end

  private

  def response(url)
    @response ||= conn.get(url) do |req|
      req.params['query'] = "#{@location}+point+of+interest"
      req.params['key']     = ENV['Google-Places-Key']
    end
  end

  def conn
    Faraday.new(:url => 'https://maps.googleapis.com') do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end
end
