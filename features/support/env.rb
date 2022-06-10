# frozen_string_literal: true

require 'capybara'
require 'capybara/cucumber'
require 'capybara/dsl'
require 'capybara/rspec/matchers'
require 'rspec'
require 'selenium-webdriver'
require 'site_prism'
require 'site_prism/all_there'
require 'report_builder'
require 'json'
require 'aws-sdk-secretsmanager'
require 'base64'

## Global
World Capybara::DSL
World Capybara::RSpecMatchers

## Definiçoes de Ambiente
# escolhido em cucumber.yml
# prod, dev, qa
SELECTED_ENV = ENV['ENV']
if SELECTED_ENV.blank?
  raise "\nConstante ENV está vazia." \
        "\nPor favor, especificar Ambiente: (prod, dev, qa)." \
        "\nEx.:" \
        "\n  $ cucumber ENV=qa" \
        "\n    ou" \
        "\n  $ cucumber -p qa" \
        "\n\n"
end

## Definiçoes de Navegador
# escolhido em cucumber.yml
# chrome, chrome_headless
SELECTED_BROWSER = ENV['BROWSER']
case SELECTED_BROWSER
when nil
  raise "\nConstante BROWSER está vazia." \
        "\nPor favor, especificar Navegador: (chrome, chrome_headless, firefox ou firefox_headless)." \
        "\nEx.:" \
        "\n  $ cucumber BROWSER=chrome_headless" \
        "\n    ou" \
        "\n  $ cucumber -p chrome_headless" \
        "\n\n"
when 'chrome'
  Capybara.register_driver :selenium_chrome do |app|
    Capybara::Selenium::Driver.load_selenium
    browser_options = ::Selenium::WebDriver::Chrome::Options.new.tap do |opts|
      opts.args << '--lang=pt-BR'
      opts.args << '--disable-site-isolation-trials'
      opts.args << '--start-maximized'
      opts.args << '--incognito'
      opts.args << '--disable-dev-shm-usage'
    end
    Capybara::Selenium::Driver.new(
      app,
      browser: :chrome,
      options: browser_options
    )
  end
  @driver = :selenium_chrome
when 'chrome_headless'
  Capybara.register_driver :selenium_chrome_headless do |app|
    Capybara::Selenium::Driver.load_selenium
    browser_options = ::Selenium::WebDriver::Chrome::Options.new.tap do |opts|
      opts.args << '--lang=pt-BR'
      opts.args << '--headless'
      opts.args << '--disable-gpu' if Gem.win_platform?
      opts.args << '--no-sandbox'
      opts.args << '--incognito'
      opts.args << '--window-size=1366x768'
      opts.args << '--disable-site-isolation-trials'
      opts.args << '--disable-dev-shm-usage'
    end
    Capybara::Selenium::Driver.new(
      app,
      browser: :chrome,
      options: browser_options
    )
  end
  @driver = :selenium_chrome_headless
when 'firefox'
  @driver = :selenium
when 'firefox_headless'
  Capybara.register_driver :selenium_firefox_headless do |app|
    browser_options = ::Selenium::WebDriver::Firefox::Options.new.tap do |opts|
      opts.args << '--headless'
      opts.args << '--window-size=1366,768'
    end
    Capybara::Selenium::Driver.new(
      app,
      browser: :firefox,
      options: browser_options
    )
  end
  @driver = :selenium_firefox_headless
end

## Defaults
ENVIRONMENT     = YAML.load_file("#{File.dirname(__FILE__)}/config/environments.yml")[SELECTED_ENV]
BASE_URL        = "#{!ENV['URL'].nil? ? ENV['URL'] : ENVIRONMENT['base_url']}/"
SCREENSHOT_PATH = 'reports/screenshots/'
REPORT_PATH     = 'reports/report-builder/'

## Verificacao da BASE_URL
if BASE_URL.blank? || BASE_URL.eql?('/')
  raise "\nConstante BASE_URL está vazia." \
        "\nPor favor, especificar a 'base_url' no arquivo de Ambiente: (prod, dev, qa)." \
        "\nEx.:" \
        "\n  features/support/config/environments.yml" \
        "\n    ou na execucao" \
        "\n  $ cucumber URL=http://url-do-ambiente.testes" \
        "\n\n"
end

## Helpers
Dir[File.join(
  File.dirname(__FILE__), '/helpers/*.rb'
)
].each do |file|
  require_relative file
end

## Pages
Dir[File.join(
  File.dirname(__FILE__), '/pages/*.rb'
)].sort.each do |file|
  require file
end

## Execucao dos testes
Capybara.configure do |config|
  config.default_driver = @driver ## Variavel para definissão de Browser
  config.default_max_wait_time = 5 ## Time global de espera
  config.app_host = BASE_URL
end
