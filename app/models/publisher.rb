class Publisher < ApplicationRecord
  has_many :books, dependent: :restrict_with_exception

  validates :name, presence: true
end
