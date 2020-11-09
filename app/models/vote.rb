class Vote < ApplicationRecord
  validates :user_id, uniqueness: { scope: :article_id }

  belongs_to :article
  belongs_to :voter, class_name: 'User', foreign_key: :user_id

  scope :popular, lambda {
                    select('article_id, count(article_id) as count')
                      .group(:article_id).order('count desc').limit(5)
                  }
end
