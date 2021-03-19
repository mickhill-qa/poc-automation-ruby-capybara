## Gerar relatorio ao final da execucao
at_exit do
  ReportBuilder.configure do |config|
    config.json_path        = "reports/report.json"                                                                                   # pasta onde salva o json
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

