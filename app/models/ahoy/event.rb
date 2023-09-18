class Ahoy::Event < ApplicationRecord
  include Ahoy::QueryMethods

  self.table_name = 'ahoy_events'

  belongs_to :visit
  belongs_to :user, optional: true

  def self.ransackable_attributes(_auth_object = nil)
    %w[id name properties time user_id visit_id]
  end
end
