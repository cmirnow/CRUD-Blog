class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  #This validates presence of title, and makes sure that the length is not more than 140 words
  validates :title, presence: true, length: {maximum: 140}
  #This validates presence of body
  #validates :body, presence: true
  acts_as_taggable_on :tag
  extend FriendlyId
  friendly_id :title, use: :slugged
end
