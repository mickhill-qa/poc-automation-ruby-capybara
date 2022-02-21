## Gerar relatorio ao final da execucao
at_exit do
  ReportBuilder.configure do |config|
    config.json_path        = "reports/report.json"                                                                                                 # pasta onde salva o json
    config.report_path      = REPORT_PATH + Time.now.strftime('%Y-%m-%d_-_%H-%M-%S_-_').to_s + SELECTED_ENV + '_' + 'web_' + SELECTED_BROWSER       # pasta onde salva o html
    config.report_types     = [:html]                                                                                                               # tipo de report a exportar
    config.report_title     = "poc-automation-ruby-capybara"                                                                                        # nome do report - <img src='#' />
    config.color            = "green"                                                                                                               # cor do report
    config.compress_images  = false
    config.include_images   = true                                                                                                                  # coloca imagens ou não
    config.additional_info  = {
      'Date': Time.now,
      'Environment': SELECTED_ENV,
      'Browser': SELECTED_BROWSER,
      'Url': BASE_URL,
      'Runtime': "ruby - #{RUBY_VERSION}"
    }
  end
  ReportBuilder.build_report

  puts "\nReportBuilder \n#{ReportBuilder.report_path}.#{ReportBuilder.report_types[0].downcase}"
end
