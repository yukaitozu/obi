class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :photo

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reviews
  has_many :listings
  has_many :bookings_as_borrower, class_name: "Booking"
  has_many :bookings_as_renter, through: :listings, source: :bookings



  validates :email, presence: true
  validates :password, presence: true
end
