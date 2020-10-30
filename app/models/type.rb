class Type < ApplicationRecord
  has_many :articles
  has_one_attached :cover
end
