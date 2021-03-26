require 'capybara'
require 'capybara/cucumber'
require 'capybara/dsl'
require 'capybara/rspec/matchers'
require 'rspec'
require 'selenium-webdriver'
require 'site_prism'
require 'report_builder'
require 'json'
require 'aws-sdk-secretsmanager'
require 'base64'

## Global
World Capybara::DSL
World Capybara::RSpecMatchers

## Helpers
Dir[File.join(
  File.dirname(__FILE__), '/helpers/*.rb')
].each do |file|
  require_relative file
end

## Definiçoes de Ambiente
# escolhido em cucumber.yml
# prod, dev, qa
SELECTED_ENV = ENV['ENV']
if SELECTED_ENV.blank?
  raise "Constante ENV está vazia.\nPor favor, especificar Ambiente: (prod, dev, qa).\nEx.:\n  $ cucumber ENV=dev\n    ou\n  $ cucumber -p dev\n\n"
  RSpec.configure do |config|
    config.filter_run_excluding type: :feature
  end
end

## Definiçoes de Navegador
# escolhido em cucumber.yml
# chrome, chrome_headless
SELECTED_BROWSER = ENV['BROWSER']
case SELECTED_BROWSER
when nil
  raise "Constante BROWSER está vazia.\nPor favor, especificar Navegador: (chrome, chrome_headless).\nEx.:\n  $ cucumber BROWSER=chrome_headless\n    ou\n  $ cucumber -p chrome_headless\n\n"
  RSpec.configure do |config|
    config.filter_run_excluding type: :feature
  end
when "chrome"
  Capybara.register_driver :selenium_chrome do |app|
    Capybara::Selenium::Driver.load_selenium
    browser_options = ::Selenium::WebDriver::Chrome::Options.new.tap do |opts|
      opts.args << '--disable-site-isolation-trials'
      opts.args << '--start-maximized'
      opts.args << '--incognito'
    end
    Capybara::Selenium::Driver.new(
      app,
      browser: :chrome,
      options: browser_options
    )
  end
  @driver = :selenium_chrome
when "chrome_headless"
  Capybara.register_driver :selenium_chrome_headless do |app|
    Capybara::Selenium::Driver.load_selenium
    browser_options = ::Selenium::WebDriver::Chrome::Options.new.tap do |opts|
      opts.args << '--headless'
      opts.args << '--disable-gpu' if Gem.win_platform?
      opts.args << '--no-sandbox'
      opts.args << '--incognito'
      opts.args << '--window-size=1366x768'
      opts.args << '--disable-site-isolation-trials'
    end
    Capybara::Selenium::Driver.new(
      app,
      browser: :chrome,
      options: browser_options
    )
  end
  @driver = :selenium_chrome_headless
end

## Defaults
ENVIRONMENT = YAML.load_file(File.dirname(__FILE__) + "/config/environments.yml")[SELECTED_ENV]
BASE_URL = !ENV['URL'].nil? ? ENV['URL'] : ENVIRONMENT['base_url']
SCREENSHOT_PATH = "reports/screenshots/"
REPORT_PATH = "reports/report-builder/"

## Execucao dos testes
Capybara.configure do |config|
  config.default_driver = @driver ## Variavel para definissão de Browser
  config.default_max_wait_time = 5 ## Time global de espera
  config.app_host = BASE_URL
end
