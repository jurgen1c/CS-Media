class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :email, :password, presence: true

  has_one_attached :avatar
  has_many :articles, dependent: :destroy
  has_many :followings, dependent: :destroy
  has_many :inverse_followings, class_name: 'Following', foreign_key: 'follow_id', dependent: :destroy

  def follows
    follows_array = followings.map { |m_following| m_following.follow }
    follows_array += inverse_followings.map { |i_following| i_following.user }
    follows_array.compact
  end

  def follow?(user)
    follows.include?(user)
  end
end
