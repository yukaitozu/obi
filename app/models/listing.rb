class Listing < ApplicationRecord
  belongs_to :user
  has_many :transactions, dependent: :destroy
  has_many :reviews, through: :transactions,  dependent: :destroy
  has_one_attached :photo

  validates :title, :price, presence: true
end
