class Post < ApplicationRecord
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_many_attached :images, dependent: :purge_later

  validates :title, presence: true, uniqueness: true, length: { maximum: 70 }
  validates :description, length: { maximum: 160 }

  acts_as_taggable_on :tag
  extend FriendlyId
  friendly_id :title, use: :slugged

  scope :published, -> { where.not(published_at: nil) }
  scope :unpublished, -> { where(published_at: nil) }

  def normalize_friendly_id(title)
    title.to_s.to_slug.normalize(transliterations: :russian).to_s
  end
end
