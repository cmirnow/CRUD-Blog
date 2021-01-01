class Category < ApplicationRecord
  has_many :posts
  validates :name, uniqueness: true
  extend FriendlyId
  friendly_id :name, use: :slugged

  scope :published, -> { where.not(published_at: nil) }
  scope :unpublished, -> { where(published_at: nil) }

  def normalize_friendly_id(name)
    name.to_s.to_slug.normalize(transliterations: :russian).to_s
  end
end
