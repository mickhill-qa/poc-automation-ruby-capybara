# frozen_string_literal: true

## Gerar relatorio ao final da execucao
at_exit do
  nome_arquivo = "#{Time.now.strftime('%Y-%m-%d_-_%H-%M-%S')}_-_#{SELECTED_ENV}_web_#{SELECTED_BROWSER}"

  ReportBuilder.configure do |config|
    config.json_path = 'reports/report.json'
    config.report_path = "#{REPORT_PATH}#{nome_arquivo}"
    config.report_types = [:html]
    config.report_title = 'poc-automation-ruby-capybara' # nome do report - <img src='#' />
    config.color = 'green'
    config.compress_images = false
    config.include_images = true
    config.additional_info = { 'Date': Time.now, 'Environment': SELECTED_ENV, 'Browser': SELECTED_BROWSER,
                               'Url': BASE_URL, 'Runtime': "ruby - #{RUBY_VERSION}" }
  end
  ReportBuilder.build_report

  if ENV['GITHUB_REPORT']
    link_github_pages = "https://mickhill-qa.github.io/poc-automation-ruby-capybara/"
    link_arquivo = "#{link_github_pages}#{nome_arquivo}.#{ReportBuilder.report_types[0].downcase}"
  else
    link_arquivo = "#{ReportBuilder.report_path}.#{ReportBuilder.report_types[0].downcase}"
  end
  puts "\nReportBuilder \n#{link_arquivo}"
end
