class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :listing
  has_many :reviews

  validates :start_date, presence: true
  validates :return_date, presence: true
end
