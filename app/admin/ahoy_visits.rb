ActiveAdmin.register Ahoy::Visit do
  permit_params :visit_token, :visitor_token, :user_id, :ip, :user_agent, :referrer, :referring_domain, :landing_page, :browser, :os, :device_type, :country, :region, :city, :latitude, :longitude, :utm_source, :utm_medium, :utm_term, :utm_content, :utm_campaign, :app_version, :os_version, :platform, :started_at
  remove_filter :events
end
