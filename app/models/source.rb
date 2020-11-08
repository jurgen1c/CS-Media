class Source < ApplicationRecord
  belongs_to :article
  has_rich_text :body

  validates :title, :body, presence: true
end
