class Article < ApplicationRecord
  validates :title, :content, presence: true
  belongs_to :creator, class_name: 'User', foreign_key: :user_id
  belongs_to :type
  has_many :votes, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :reviewers, through: :reviews, dependent: :destroy
  has_many :sources
  has_many :comments
  has_many_attatched :images
  has_rich_text :content
  has_nested_attributes_for :sources
end
