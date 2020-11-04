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
  validates_associated :sources, on: :create
  validates :title, :body, presence: true
  after_commit :add_default_cover, on: %i[create update]

  scope :ordered_by_most_recent, -> { order(created_at: :desc) }

  def cover_thumbnail
    avatar.variant(resize: "200X400!").processed
  end

  private

  def add_default_cover
    unless cover.attached?
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
end
