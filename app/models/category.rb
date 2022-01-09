class Category < ApplicationRecord
  has_many :posts
  has_one_attached :image, dependent: :purge_later

  validates :title, presence: true, uniqueness: true, length: { minimum: 2, maximum: 70 }

  extend FriendlyId
  friendly_id :title, use: :slugged

  scope :published, -> { where.not(published_at: nil) }
  scope :unpublished, -> { where(published_at: nil) }

  def normalize_friendly_id(title)
    title.to_s.to_slug.normalize(transliterations: :russian).to_s
  end
end
