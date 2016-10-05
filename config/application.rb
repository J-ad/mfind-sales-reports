require_relative 'boot'

require 'rails/all'
# require 'iconv'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MfindSalesReports
  class Application < Rails::Application
    config.generators do |g|
      g.test_framework :rspec
      g.integration_tool :rspec
      g.fixture_replacement :factory_girl, dir: 'spec/factories'
    end

    config.autoload_paths += Dir["#{config.root}/app/**/"]
    config.autoload_paths += Dir["#{config.root}/lib/**/"]
  end
end
