require "capybara/cucumber"
require "ffaker"
require "pry"
require "rspec"
require "selenium-webdriver"

Capybara.configure do |config|
  config.default_driver = :selenium
  config.default_max_wait_time = 20
  config.app_host = "http://automationpractice.com/index.php"
end
