require 'rails_helper'

RSpec.feature 'Favorites' do 
  scenario 'User saves location as favorite' do 
    user = User.create!(name: 'Rajaa', email: 'rajaa@email.com', password: '123', password_confirmation: '123')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    location = 'Denver,Co'
    visit '/home'
    fill_in :location, with: location
    click_on 'Submit'
  
    expect(current_path).to eq('/results')
    
    click_on "Add #{location} to your Favorites"
    
    expect(current_path).to eq('/results')
    expect(page).to have_content("#{location} has been added to your Favorites")
  end 
end 