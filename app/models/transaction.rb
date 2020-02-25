class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :listing

  validates :start_date, presence: true
  validates :return_date, presence: true
end
