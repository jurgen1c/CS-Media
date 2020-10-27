class Review < ApplicationRecord
  belongs_to :user
  belongs_to :article
  has_many :sources
end
