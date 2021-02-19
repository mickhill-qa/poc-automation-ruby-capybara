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
SCREENSHOT_PATH  = "results/screenshots/"
REPORT_PATH      = "results/report-builder/"


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



## Gerar relatorio ao final da execucao
at_exit do
  ReportBuilder.configure do |config|
    config.json_path        = "results/report.json"                                                                                   # pasta onde salva o json
    config.report_path      = REPORT_PATH + Time.now.strftime('%Y-%m-%d_-_%H-%M-%S_-_').to_s + SELECTED_ENV + '_' + SELECTED_BROWSER  # pasta onde salva o html
    config.report_types     = [:html]                                                                                                 # tipo de report a exportar
    config.report_title     = "Cucumber Report"                                                                                       # nome do report - <img src='#' />
    config.color            = "blue"                                                                                                  # cor do report
    config.include_images   = true                                                                                                    # se coloca imagens ou não
    config.additional_info  = {
      'Date': Time.now,
      'Browser': SELECTED_BROWSER, 
      'Environment': SELECTED_ENV,
      'Url': BASE_URL,
      'Runtime': "ruby - #{RUBY_VERSION}"
    } 
  end
  ReportBuilder.build_report
end

## Execucao dos testes
Capybara.configure do |config|
  config.default_driver        = @driver              ## Variavel para definissão de Browser
  config.default_max_wait_time = 5                    ## Time global de espera
  config.app_host              = BASE_URL
end
