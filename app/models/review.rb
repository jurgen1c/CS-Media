class Review < ApplicationRecord
  belongs_to :reviewer, class_name: 'User', foreign_key: :user_id
  belongs_to :article
  has_rich_text :body

  validates :title, :body, :user, :article, presence: true
end
