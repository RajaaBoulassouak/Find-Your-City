class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates_presence_of :name, :password
  has_many :favorites
  has_many :locations, through: :favorites
  has_secure_password
end
