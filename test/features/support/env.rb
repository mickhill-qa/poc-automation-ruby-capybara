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
require_relative 'page_helper.rb'
require_relative 'screenshot_helper.rb'


## Global
World Capybara::DSL
World Capybara::RSpecMatchers
World Page
World ScreenshotHelper


## Definiçoes de ambiente
BROWSER  = ENV['BROWSER']
AMB    = ENV['AMB']
BASE_URL = YAML.load_file(File.dirname(__FILE__) + "/config/environments.yml")[AMB]


case AMB
  when AMB.blank?
    raise "Constante AMB está vazia.\nPor favor, especificar Ambiente: (prod, dev, qa)."
    RSpec.configure do |config|
      config.filter_run_excluding type: :feature
    end
end


## executa navegador de acordo com o navegador escolhido em cucumber.yml
# :selenium_headless, :selenium_chrome, :selenium_chrome_headless
case BROWSER
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

  when BROWSER.blank?
    raise "Constante BROWSER está vazia.\nPor favor, especificar BROWSER: [chrome, chrome_headless]."
end


ReportBuilder.configure do |config|
  config.json_path        = "results/report.json"   #pasta onde salva o json
  config.report_path      = "results/report"        #pasta onde salva o html
  config.report_types     = [:html]                 #tipo de report a exportar
  config.report_title     = "Report My Store"       #nome do report
  config.color            = "blue"                  #cor do report
  config.include_images   = true                    #se coloca imagens ou não
  config.additional_info  = {
    browser: ENV['BROWSER'], 
    ambiente: ENV['AMB']
  } 
end
at_exit do                                          #Gerar relatorio ao final da execucao
  ReportBuilder.build_report
end


Capybara.configure do |config|
  config.default_driver   = @driver                 ## Variavel para definissão de Browser
  config.app_host         = BASE_URL['base_url']
  config.default_max_wait_time  = 15                ## Time global de espera
end
