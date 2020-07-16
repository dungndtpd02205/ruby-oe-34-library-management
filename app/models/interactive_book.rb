class InteractiveBook < ApplicationRecord
  belongs_to :book
  belongs_to :user

  validates :action, presence: true
end
