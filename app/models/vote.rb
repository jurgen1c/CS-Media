class Vote < ApplicationRecord
  belongs_to :article
  belongs_to :voter, class_name: 'User', foreign_key: :user_id

  
end
