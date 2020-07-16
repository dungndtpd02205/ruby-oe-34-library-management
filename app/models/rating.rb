class Rating < ApplicationRecord
  belongs_to :book
  belongs_to :user

  validates :rate, presence: true
  validates :content, presence: true
end
