class Type < ApplicationRecord
  has_many :articles
  has_one_attached :background
  validates :name, presence: true
end
