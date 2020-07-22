class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze

  has_many :active_relationships, class_name: "FollowUser",
    foreign_key: "follower_id", dependent: :destroy,
    inverse_of: :user
  has_many :passive_relationships, class_name: "FollowUser",
    foreign_key: "followed_id", dependent: :destroy,
    inverse_of: :user
  has_many :following, through: :active_relationships,
    source: :followed
  has_many :followers, through: :passive_relationships,
    source: :follower
  has_many :request_borrow_books, dependent: :restrict_with_exception
  has_many :interactive_books, dependent: :restrict_with_exception
  has_many :follow_authors, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_one_attached :image

  validates :full_name, presence: true,
    length: {maximum: Settings.users.max_name}
  validates :email, presence: true,
    length: {maximum: Settings.users.max_email},
    format: {with: VALID_EMAIL_REGEX}, uniqueness: true
  validates :password, allow_nil: true,
    length: {minimum: Settings.users.min_pass}

  before_save :downcase_email

  has_secure_password

  private

  def downcase_email
    self.email = email.downcase
  end
end
