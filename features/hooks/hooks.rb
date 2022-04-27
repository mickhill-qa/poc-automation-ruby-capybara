# frozen_string_literal: true

### Global ###
# Before do
#     log 'Inicio de todos os Cenarios.'
# end

After do |scenario|
  scenario_name = scenario.name.gsub(/[^\w\-]/, '_')
  screenshot_name("ERRO_#{scenario_name.downcase!}") if scenario.failed?
end

### Tag ###
# Before '@pesquisaUndefined' do
#     log 'Apenas no INICIO desse Cenarios'
# end

# After '@pesquisaUndefined' do
#     log 'Apenas no FIM desse Cenarios'
# end
