class Slider < ApplicationRecord
  has_many_attached :images, dependent: :purge_later
  scope :published, -> { where.not(published_at: nil) }
  scope :unpublished, -> { where(published_at: nil) }

  def self.ransackable_attributes(_auth_object = nil)
    %w[captions color created_at dark fade id interval name published_at updated_at]
  end
end
