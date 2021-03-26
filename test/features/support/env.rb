require 'capybara'
require 'capybara/cucumber'
require 'capybara/dsl'
require 'capybara/rspec/matchers'
require 'rspec'
require 'selenium-webdriver'
require 'site_prism'
require 'report_builder'
require 'json'


## Arquivo que inicia todas as minhas classes
require_relative 'helpers/page_helper.rb'
require_relative 'helpers/screenshot_helper.rb'


## Global
World Capybara::DSL
World Capybara::RSpecMatchers
World PageHelper
World ScreenshotHelper


## Definiçoes de ambiente
SELECTED_BROWSER = ENV['BROWSER']
SELECTED_ENV     = ENV['ENV']
ENVIRONMENT      = YAML.load_file(File.dirname(__FILE__) + "/config/environments.yml")[SELECTED_ENV]
BASE_URL         = !ENV['URL'].nil? ? ENV['URL'] : ENVIRONMENT['base_url']


## Paths Default
SCREENSHOT_PATH  = "reports/screenshots/"
REPORT_PATH      = "reports/report-builder/"


case SELECTED_ENV
when SELECTED_ENV.blank?
  raise "Constante ENV está vazia.\nPor favor, especificar Ambiente: (prod, dev, qa)."
  RSpec.configure do |config|
    config.filter_run_excluding type: :feature
  end
end


## executa navegador de acordo com o navegador escolhido em cucumber.yml
# :selenium_headless, :selenium_chrome, :selenium_chrome_headless
case SELECTED_BROWSER
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
  
when SELECTED_BROWSER.blank?
  raise "Constante BROWSER está vazia.\nPor favor, especificar BROWSER: [chrome, chrome_headless]."
end



## Execucao dos testes
Capybara.configure do |config|
  config.default_driver        = @driver              ## Variavel para definissão de Browser
  config.default_max_wait_time = 5                    ## Time global de espera
  config.app_host              = BASE_URL
end
