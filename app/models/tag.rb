class Tag < ApplicationRecord
  has_many :restaurants, through: :taggings
end
