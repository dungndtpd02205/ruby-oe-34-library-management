class Author < ApplicationRecord
  has_many :books, dependent: :restrict_with_exception
  has_many :follow_authors, dependent: :destroy
  has_one_attached :image

  validates :full_name, presence: true
end
