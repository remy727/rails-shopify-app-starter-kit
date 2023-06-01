# frozen_string_literal: true

Sentry.init do |config|
  config.dsn = ENV["SENTRY_DSN"]
  config.breadcrumbs_logger = %i[active_support_logger http_logger]
  config.traces_sample_rate = ENV["SENTRY_TRACES_SAMPLE_RATE"].to_f
  config.environment = ENV["SENTRY_CURRENT_ENV"]
end
