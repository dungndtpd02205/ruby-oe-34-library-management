class Author < ApplicationRecord
  has_many :books, dependent: :restrict_with_exception
  has_many :follow_authors, dependent: :destroy
  has_one_attached :image

  validates :full_name, presence: true
  validates :image,
    content_type:{in: %w[image/jpeg image/gif image/png],
      message: Settings.image.vali },
    size:{less_than: 5.megabytes, message: Settings.image.vali2 }

  scope :sort_by_created_date, ->{order created_at: :desc}

  def display_image_table
    image.variant(resize_to_limit: [Settings.image.table, Settings.image.table])
  end

  def display_image_form
    image.variant(resize_to_limit: [Settings.image.form, Settings.image.form])
  end
end
