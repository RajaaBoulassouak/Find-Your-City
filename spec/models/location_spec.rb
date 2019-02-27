require 'rails_helper'

RSpec.describe Location, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :name}
  end
  
  describe 'Relationships' do
    it { should have_many :favorites }
    it { should have_many :users }
  end
end 
