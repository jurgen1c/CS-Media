class Article < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :user_id
  belongs_to :type, class_name: 'Type', foreign_key: :type_id
  has_many :votes, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :reviewers, through: :reviews
  has_many :sources, inverse_of: :article
  has_many :comments

  has_one_attached :cover
  has_rich_text :body
  accepts_nested_attributes_for :sources, allow_destroy: true

  validates_associated :sources, on: :create
  validates :title, :body, presence: true
  validates :cover, content_type: ['image/png', 'image/jpg', 'image/jpeg']

  after_commit :add_default_cover, on: %i[create update]

  scope :ordered_by_most_recent, -> { order(created_at: :desc) }

  def cover_thumbnail
    cover.variant(resize: '650X300!').processed
  end

  private

  def add_default_cover
    return if cover.attached?

    cover.attach(
      io: File.open(
        Rails.root.join(
          'app', 'assets', 'images', 'covers', 'default_cover.jpg'
        )
      ),
      filename: 'default_cover.jpg',
      content_type: 'image/jpg'
    )
  end
end
