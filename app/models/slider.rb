class Slider < ApplicationRecord
  has_many_attached :images, dependent: :purge_later
  scope :published, -> { where.not(published_at: nil) }
  scope :unpublished, -> { where(published_at: nil) }
end
