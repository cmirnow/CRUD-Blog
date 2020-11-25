class Ahoy::Store < Ahoy::DatabaseStore
end

# set to true for JavaScript tracking
Ahoy.api = false

 # better user agent parsing
Ahoy.user_agent_parser = :device_detector
 # Get the bots and know when they index you...
Ahoy.track_bots = true 

Ahoy.server_side_visits = :when_needed