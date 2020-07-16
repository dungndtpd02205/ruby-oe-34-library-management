class Categories < ApplicationRecord
  has_many :books, dependent: :restrict_with_exception

  validates :name, presence: true,
    length: {maximum: Settings.categories.length_name}
end
