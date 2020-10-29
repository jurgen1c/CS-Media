class Vote < ApplicationRecord
  validates :user_id, uniqueness: { scope: :article_id }

  belongs_to :article
  belongs_to :voter, class_name: 'User', foreign_key: :user_id

  
end
