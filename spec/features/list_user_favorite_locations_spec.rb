require 'rails_helper'

RSpec.feature 'Favorites' do 
  scenario 'user can see a list of their favorite locations' do 
    user = User.create!(name: 'Rajaa', email: 'rajaa@email.com', password: '123', password_confirmation: '123')
    location_1 = Location.create(name: 'Denver')
    location_2 = Location.create(name: 'Sydney')
    location_3 = Location.create(name: 'Tokio')
    favorite_1 = user.favorites.create!(location_id: location_1.id)
    favorite_2 = user.favorites.create!(location_id: location_2.id)
    favorite_3 = user.favorites.create!(location_id: location_3.id)
    
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    
    visit "/users/#{user.id}/favorites"
    expect(page).to have_css('.favorite', count: 3)
    
    within(first('.favorite')) do 
      expect(page).to have_css('.name')
    end
  end 
end 