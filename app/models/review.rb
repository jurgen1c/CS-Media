class Review < ApplicationRecord
  belongs_to :user
  belongs_to :article
  has_rich_text :body

  validates :title, :body, :user, :article, presence: true
end
