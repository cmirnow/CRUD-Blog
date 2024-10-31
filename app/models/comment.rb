class Comment < ApplicationRecord
  belongs_to :post
  validates :post, presence: true
  validates :commenter, presence: true, length: { minimum: 3, maximum: 15 }
  validates :body, presence: true, length: { minimum: 3, maximum: 999 }

  scope :published, -> { where.not(published_at: nil) }
  scope :unpublished, -> { where(published_at: nil) }

  def self.ransackable_associations(auth_object = nil)
    %w[post]
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[body commenter created_at id post_id published_at updated_at]
  end
end
