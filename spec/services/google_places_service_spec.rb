require 'rails_helper'

RSpec.describe GooglePlacesService do 
  it 'exists' do
    location = 'denver,co'
    service = GooglePlacesService.new(location)

    expect(service).to be_a(GooglePlacesService)
  end

  it 'gets the places for location' do 
    location = 'denver,co'
    service = GooglePlacesService.new(location)
    places = service.get_places
    expect(places).to be_a(Array)
    expect(places.first).to have_key(:formatted_address)
  end 
end