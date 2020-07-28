class RequestBorrowBook < ApplicationRecord
  belongs_to :book
  belongs_to :user

  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :check_date

  scope :sortby_created_date, ->{order :status, :start_date}

  enum status: {borrowing: 0, returned: 1}

  private

  def check_date
    return if end_date.nil? || start_date.nil?
    if end_date < start_date
      errors.add(:end_date, t("borrow.end_date"))
    end
  end
end
