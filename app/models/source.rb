class Source < ApplicationRecord
  belongs_to :article, optional: true
  has_rich_text :body
end
