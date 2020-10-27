class Article < ApplicationRecord
  validates :title, :content, presence: true
  belongs_to :creator, class_name: 'User', foreign_key: :user_id
  belongs_to :category
  has_many :votes
  has_many :reviews, dependent: :destroy
  has_many :reviewers, through: :reviews, dependent: :destroy
  has_many :sources
  has_many_attatched :images
end
