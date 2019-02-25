require 'rails_helper'

RSpec.describe 'User Authentication' do
  describe 'Registration' do
    it 'should register a new user' do 
      username = 'Rajaa'
      email = 'rajaa@email.com'
      
      visit '/home'
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
    
    it 'should not register a new user if invalid entry' do 
      user_1 = User.create!(name: 'Rajaa', email: 'rajaa@email.com', password: '123', password_confirmation: '123')
      username = 'Rajaaa'
      email = 'rajaa@email.com'
      
      visit '/home'
      click_on 'Sign Up'

      expect(current_path).to eq(new_user_path)

      fill_in :user_name, with: username
      fill_in :user_email, with: email
      fill_in :user_password, with: '123'
      fill_in :user_password_confirmation, with: '123'
      click_on 'Create User'
      
      expect(current_path).to eq(users_path)
      expect(page).to have_content('Oops, could not create account. Please use a valid email and password and try again.')
    end 
  end 
  
  describe 'Login/Logout' do 
    it 'should allow user to log in and out' do 
      user_1 = User.create!(name: 'Rajaa', email: 'rajaa@email.com', password: '123', password_confirmation: '123')
      
      visit '/home'
      click_on 'Log In'

      expect(current_path).to eq(login_path)

      fill_in :email, with: user.email
      fill_in :password, with: user.password
      click_on 'Log In!'
      
      expect(current_path).to eq(user_path(user))
      expect(page).to have_content("Logged in as #{user.name}")
      
      click_on 'Log Out'
      
      expect(current_path).to eq()
      expect(page).to have_content('You have been successfully logged out!')
    end 
  end
end