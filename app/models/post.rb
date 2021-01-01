class Post < ApplicationRecord
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_many_attached :images, dependent: :purge_later
  # This validates presence of title, and makes sure that the length is not more than 140 words
  validates :title, presence: true, length: { maximum: 140 }
  # This validates presence of body
  # validates :body, presence: true
  acts_as_taggable_on :tag
  extend FriendlyId
  friendly_id :title, use: :slugged

  scope :published, -> { where.not(published_at: nil) }
  scope :unpublished, -> { where(published_at: nil) }

  def normalize_friendly_id(title)
    title.to_s.to_slug.normalize(transliterations: :russian).to_s
  end
end
