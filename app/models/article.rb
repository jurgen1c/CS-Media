class Article < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :user_id
  belongs_to :type
  has_many :votes, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :reviewers, through: :reviews
  has_many :sources,  inverse_of: :article
  has_many :comments
  has_one_attached :cover
  has_rich_text :body
  accepts_nested_attributes_for :sources, allow_destroy: true
# validates_associated :sources, presence: true
  validates :title, presence: true

  scope :ordered_by_most_recent, -> { order(created_at: :desc) }
end
