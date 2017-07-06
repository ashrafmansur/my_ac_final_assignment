class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :notes, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_many :followings, class_name: 'Following', foreign_key: 'follower_id', dependent: :destroy
  has_many :followers,  class_name: 'Following', foreign_key: 'followee_id', dependent: :destroy

  validates :username, uniqueness: { case_sensitive: false }, presence: true, length: { minimum: 3 }
  validates :email, uniqueness: { case_sensitive: false }, presence: true
end
