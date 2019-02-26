require 'rails_helper'

RSpec.feature 'Favorites' do 
  scenario 'user can see a list of their favorite locations' do 
    user_1 = User.create!(name: 'Rajaa', email: 'rajaa@email.com', password: '123', password_confirmation: '123')
    user_2 = User.create!(name: 'lala', email: 'email.com', password: '123', password_confirmation: '123')
    location_1 = Location.create(name: 'Denver')
    location_2 = Location.create(name: 'Sydney')
    location_3 = Location.create(name: 'Tokio')
    favorite_1 = user_1.favorites.create!(location_id: location_1.id)
    favorite_2 = user_1.favorites.create!(location_id: location_2.id)
    favorite_3 = user_2.favorites.create!(location_id: location_3.id)
    
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_1)
    
    visit "/users/#{user_1.id}/favorites"
    expect(page).to have_css('.favorite', count: 2)
    
    within(first('.favorite')) do 
      expect(page).to have_css('.name')
    end
  end 
end 