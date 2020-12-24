class Slider < ApplicationRecord
  has_many_attached :images
  scope :published, -> { where.not(published_at: nil) }
  scope :unpublished, -> { where(published_at: nil) }
end
