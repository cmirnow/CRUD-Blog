class Ahoy::Visit < ApplicationRecord
  self.table_name = 'ahoy_visits'

  has_many :events, class_name: 'Ahoy::Event'
  belongs_to :user, optional: true

  def self.ransackable_attributes(_auth_object = nil)
    %w[app_version browser city country device_type id ip landing_page latitude longitude
       os os_version platform referrer referring_domain region started_at user_agent user_id utm_campaign utm_content utm_medium utm_source utm_term visit_token visitor_token]
  end
end
