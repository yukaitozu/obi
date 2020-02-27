class Booking < ApplicationRecord
  belongs_to :borrower, class_name: "User", foreign_key: "user_id"
  belongs_to :listing
  has_one :renter, through: :listing, source: :user
  has_many :reviews

  validates :start_date, presence: true
  validates :return_date, presence: true
end
