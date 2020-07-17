class Book < ApplicationRecord
  belongs_to :author
  belongs_to :categorie
  belongs_to :publisher
  has_many :interactive_books, dependent: :destroy
  has_many :request_borrow_books, dependent: :restrict_with_exception
  has_many :ratings, dependent: :destroy
  has_one_attached :image

  accepts_nested_attributes_for :author, :publisher

  validates :name, presence: true, length: {maximum: Settings.book.length_name}
  validates :publish_day, presence: true
  validates :quantity, presence: true
  validates :num_of_pages, presence: true
end
