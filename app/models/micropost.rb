class Micropost < ApplicationRecord
  belongs_to :user
  
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 255 }
  
  has_many :reverses_of_likes, class_name: 'Like', foreign_key: 'micropost_id'
  has_many :liked, through: :reverses_of_likes, source: :user
  
end