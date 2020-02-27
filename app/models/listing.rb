class Listing < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_by_title_and_description,
    against: [ :title, :description ],
    using: {
      tsearch: { prefix: true }
    }
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings,  dependent: :destroy
  has_one_attached :photo

  validates :title, :price, presence: true
end
