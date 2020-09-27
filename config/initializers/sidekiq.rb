# frozen_string_literal: true

url = Rails.env.production? ? ENV.fetch('REDIS_URL') : 'redis://localhost:6379'

Sidekiq.configure_client do |config|
  config.redis = { url: url, size: 1, network_timeout: 5 }
end

Sidekiq.configure_server do |config|
  config.redis = { url: url, size: 12, network_timeout: 5 }
end
