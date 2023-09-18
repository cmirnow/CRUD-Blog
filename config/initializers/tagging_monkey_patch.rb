class ActsAsTaggableOn::Tagging
  def self.ransackable_attributes(_auth_object = nil)
    %w[context created_at id tag_id taggable_id taggable_type tagger_id tagger_type]
  end
end
