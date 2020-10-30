class Review < ApplicationRecord
  belongs_to :user
  belongs_to :article
  has_many :sources
  has_rich_text :body
end
