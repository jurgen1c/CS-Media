class Source < ApplicationRecord
  belongs_to :review
  belongs_to :article
  has_many_attached :files
end
