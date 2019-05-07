require 'rails_helper'

RSpec.feature 'Visitor can enter a city/location' do 
  scenario 'and receives recommended places to visit' do 
    location = 'Denver,Co'
    visit '/'
    fill_in :location, with: location
    click_on 'Search'
  
    expect(current_path).to eq('/results')
    
    expect(page).to have_css('.place')
    within(first('.place', count: 20)) do 
      expect(page).to have_css('.map')
      expect(page).to have_css('.name')
      expect(page).to have_css('.address')
      expect(page).to have_css('.rating')
      expect(page).to have_css('.ratings-total')
    end
  end 
end 