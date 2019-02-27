require 'rails_helper'

RSpec.feature 'Visitor can enter a city/location' do 
  scenario 'and receives recommended places to visit' do 
    location = 'Denver,Co'
    visit '/home'
    fill_in :location, with: location
    click_on 'Search'
  
    expect(current_path).to eq('/results')
    
    expect(page).to have_css('.place')
    within(first('.place')) do 
      expect(page).to have_css('.map')
      expect(page).to have_css('.name')
      expect(page).to have_css('.address')
      expect(page).to have_css('.rating')
      expect(page).to have_css('.ratings-total')
      expect(page).to have_content("Tropical Discovery")
      expect(page).to have_content("2900 E 23rd Ave, Denver, CO 80205, USA")
      expect(page).to have_content(4.7)
    end
  end 
end 