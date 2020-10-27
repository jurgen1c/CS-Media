class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :username, :email, :password, presence: true

  has_one_attached :avatar
  has_many :followings, dependent: :destroy
  has_many :follows, through: :followings, dependent: :destroy

  
end
