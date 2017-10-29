class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy
  geocoded_by :address
  has_many :taggings
  has_many :tags, through: :taggings
  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }
  validates :name, presence: true, length: { maximum: 50 }
  validates :address, presence: true, length: { maximum: 255 }
end
