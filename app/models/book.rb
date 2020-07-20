class Book < ApplicationRecord
  belongs_to :author
  belongs_to :categories
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

  scope :sort_name_or_create_at, ->{order :name, :created_at}
  scope :search_by_book_name, ->(value){where "name LIKE ?", "%#{value}%"}
  scope :search_by_category_name,
    ->(value){where "categories.name LIKE ?", "%#{value}%"}
  scope :search_by_author_name,
    ->(value){where "authors.full_name LIKE ?", "%#{value}%"}
  scope :search_by_publish_name,
    ->(value){where "publishers.name LIKE ?", "%#{value}%"}
end
