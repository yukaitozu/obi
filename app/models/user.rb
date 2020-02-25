class User < ApplicationRecord
  has_many :reviews
  has_many :transactions
  has_many :listings, through: :transactions


  validates :first_name, presence: true
  validates :last_name, presence: true
end
