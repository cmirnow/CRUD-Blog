class Ahoy::Store < Ahoy::DatabaseStore
end

# set to true for JavaScript tracking
Ahoy.api = false

# better user agent parsing
Ahoy.user_agent_parser = :device_detector
# Get the bots and know when they index you...
Ahoy.track_bots = true

Ahoy.server_side_visits = :when_needed

# Deleting old entries
if ActiveRecord::Base.connection.table_exists? 'ahoy_visits'
  Ahoy::Visit.where('started_at < ?', 7.days.ago).find_in_batches do |visits|
    visit_ids = visits.map(&:id)
    Ahoy::Event.where(visit_id: visit_ids).delete_all
    Ahoy::Visit.where(id: visit_ids).delete_all
  end
end
