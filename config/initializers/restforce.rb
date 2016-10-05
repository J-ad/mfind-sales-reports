# frozen_string_literal: true

Restforce.configure do |config|
  config.username = ENV['SALESFORCE_USERNAME']
  config.password = ENV['SALESFORCE_PASSWORD']
  config.security_token = ENV['SALESFORCE_SECRET_TOKEN']
  config.client_id = ENV['SALESFORCE_CUSTOMER_KEY']
  config.client_secret = ENV['SALESFORCE_CUSTOMER_SECRET']
  config.api_version = '32.0'
  config.host = ENV['SALESFORCE_SANDBOX'] if ENV['SALESFORCE_SANDBOX']
end
