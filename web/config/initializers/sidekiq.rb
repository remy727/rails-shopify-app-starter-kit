# frozen_string_literal: true

redis_hsh = {
  url: ENV["REDIS_URL"] || "redis://localhost:6379",
  ssl_params: {
    verify_mode: OpenSSL::SSL::VERIFY_NONE
  },
  network_timeout: 5,
  pool_timeout: 5,
}

Sidekiq.configure_server do |config|
  config.redis = redis_hsh
end

Sidekiq.configure_client do |config|
  config.redis = redis_hsh
end
