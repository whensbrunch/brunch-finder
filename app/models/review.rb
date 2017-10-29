class Review < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :restaurant_id, presence: true
  validates :content, presence: true
  validate  :picture_size # use validate for custom validation
  mount_uploader :picture, PictureUploader

  private

    # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
end
