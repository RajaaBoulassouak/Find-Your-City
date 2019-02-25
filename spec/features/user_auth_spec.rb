require 'rails_helper'

RSpec.describe 'User Authentication' do
  describe 'Registration' do
    it 'should register a new user' do 
      username = 'Rajaa'
      email = 'rajaa@email.com'
      
      visit '/results'
      click_on 'Sign Up'

      expect(current_path).to eq(new_user_path)

      fill_in :user_name, with: username
      fill_in :user_email, with: email
      fill_in :user_password, with: '123'
      fill_in :user_password_confirmation, with: '123'
      click_on 'Create User'
      
      expect(current_path).to eq(user_path(User.last))
      expect(page).to have_content("Successfully created account for #{User.last.name}!")
    end 
  end 
end