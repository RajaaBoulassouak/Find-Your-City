class Location < ApplicationRecord
  validates_presence_of :name
  has_many :favorites
  has_many :users, through: :favorites
end
