class ActsAsTaggableOn::Tag
  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at id name taggings_count updated_at]
  end
end
