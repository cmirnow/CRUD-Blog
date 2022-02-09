class Slideshow < ApplicationRecord
  has_many_attached :images, dependent: :purge_later
  scope :published, -> { where.not(published_at: nil) }
  scope :unpublished, -> { where(published_at: nil) }

  PROFILE_JSON_SCHEMA = Pathname.new(Rails.root.join('config', 'schemas', 'slideshow.json'))
  validates :options, presence: true, json: {
    schema: PROFILE_JSON_SCHEMA,
    message: ->(errors) { errors }
  }
end
