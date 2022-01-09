class Comment < ApplicationRecord
  belongs_to :post
  validates :post, presence: true
  validates :commenter, presence: true, length: { minimum: 3, maximum: 15 }
  validates :body, presence: true, length: { minimum: 3, maximum: 999 }

  scope :published, -> { where.not(published_at: nil) }
  scope :unpublished, -> { where(published_at: nil) }
end
