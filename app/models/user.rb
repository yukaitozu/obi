class User < ApplicationRecord
  has_many :reviews
  has_many :bookings
  has_many :listings, through: :bookings


  validates :first_name, presence: true
  validates :last_name, presence: true
end
