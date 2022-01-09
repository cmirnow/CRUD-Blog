class Post < ApplicationRecord
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_many_attached :images, dependent: :purge_later

  validates :category, presence: true
  validates :title, presence: true, uniqueness: true, length: { minimum: 3, maximum: 70 }
  validates :description, length: { minimum: 4, maximum: 160 }, allow_blank: true

  acts_as_taggable_on :tag
  extend FriendlyId
  friendly_id :title, use: :slugged

  scope :published, -> { where.not(published_at: nil) }
  scope :unpublished, -> { where(published_at: nil) }

  def normalize_friendly_id(title)
    title.to_s.to_slug.normalize(transliterations: :russian).to_s
  end
end
