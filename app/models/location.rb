class Location < ApplicationRecord
  validates_presence_of :name
  has_many :favorites
  has_many :users, through: :favorites
  
  def self.find_or_create_from_location_params(location_name)
    where(name: location_name).first_or_initialize.tap do |location|
      location.name = location_name
      location.save!
    end 
  end
end