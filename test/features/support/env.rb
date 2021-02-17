require 'capybara'
require 'capybara/cucumber'
require 'rspec'
require 'selenium-webdriver'


## Parametro do Cucumber.yml / CommandLine ##
# Como usar no terminal:
#
#   $ cucumber url_test='https://facebook.com'
#
#
SELECTED_ENV    = ENV['ENVIRONMENT']
ENVIRONMENT     = YAML.load_file(File.dirname(__FILE__) + "/config/environments.yml")[SELECTED_ENV]
BASE_URL        = !ENV['url_test'].nil? ? ENV['url_test'] : ENVIRONMENT['base_url']


## Config ##
Capybara.configure do |config|
    config.default_driver = :selenium_chrome
    config.default_max_wait_time = 5
    config.app_host = BASE_URL
end
