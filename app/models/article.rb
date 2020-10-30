class Article < ApplicationRecord
  belongs_to :user
  belongs_to :type
  has_many :votes, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :sources
  has_many :comments
  has_rich_text :body
  accepts_nested_attributes_for :sources
  validates_associated :sources
  validates :title, :body, presence: true

  scope :ordered_by_most_recent, -> { order(created_at: :desc) }
end
