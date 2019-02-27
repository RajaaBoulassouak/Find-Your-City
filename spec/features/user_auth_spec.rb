require 'rails_helper'

RSpec.describe 'User Authentication' do
  describe 'Registration' do
    it 'should sign up a new user' do 
      username = 'Rajaa'
      email = 'rajaa@email.com'
      
      visit '/'
      click_on 'Sign Up'

      expect(current_path).to eq('/users/new')

      fill_in :user_name, with: username
      fill_in :user_email, with: email
      fill_in :user_password, with: '123'
      fill_in :user_password_confirmation, with: '123'
      click_on 'Sign Up!'
      
      user = User.last
      expect(current_path).to eq('/')
    end 
    
    it 'should not sign up a new user if invalid entry' do 
      user = User.create!(name: 'Rajaa', email: 'rajaa@email.com', password: '123', password_confirmation: '123')
      username = 'Rajaaa'
      email = 'rajaa@email.com'
      
      visit '/'
      click_on 'Sign Up'

      expect(current_path).to eq('/users/new')

      fill_in :user_name, with: username
      fill_in :user_email, with: email
      fill_in :user_password, with: '123'
      fill_in :user_password_confirmation, with: '123'
      click_on 'Sign Up!'
      
      expect(current_path).to eq('/users')
    end 
  end 
  
  describe 'Sign In/Sign Out' do 
    it 'should allow user to sign in and out' do 
      user = User.create!(name: 'Rajaa', email: 'rajaa@email.com', password: '123', password_confirmation: '123')
  
      visit '/'
      click_on 'Sign In'
  
      expect(current_path).to eq('/login')
  
      fill_in :email, with: user.email
      fill_in :password, with: user.password
      click_on 'Sign In!'
  
      expect(current_path).to eq('/')
  
      click_on 'Sign Out'
      
      expect(current_path).to eq('/')
    end 
    
      it 'should not allow user to sign in' do 
      user = User.create!(name: 'Rajaa', email: 'rajaa@email.com', password: '123', password_confirmation: '123')
      
      visit '/'
      click_on 'Sign In'

      expect(current_path).to eq('/login')

      fill_in :email, with: user.email
      fill_in :password, with: '000'
      click_on 'Sign In!'
      
      expect(current_path).to eq('/login')
    end 
  end
end