class User < ApplicationRecord
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
end
