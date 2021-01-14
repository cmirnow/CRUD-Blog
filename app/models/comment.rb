class Comment < ApplicationRecord
  belongs_to :post
  validates :commenter, presence: true
  validates :body, presence: true

  scope :published, -> { where.not(published_at: nil) }
  scope :unpublished, -> { where(published_at: nil) }
end
