class InteractiveBook < ApplicationRecord
  belongs_to :book
  belongs_to :user

  validates :action, presence: true

  enum action: {like: 0, follow: 1}
end
