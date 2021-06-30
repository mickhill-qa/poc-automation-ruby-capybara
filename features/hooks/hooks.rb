### Global ###
# Before do
#     log 'Inicio de todos os Cenarios.'
# end

After do |scenario|
  scenario_name = scenario.name.gsub(/[^\w\-]/, ' ')

  if scenario.failed?
    screenshot_erro(scenario_name.downcase!)
  end
end


### Tag ###
# Before '@pesquisaUndefined' do
#     log 'Apenas no INICIO desse Cenarios'
# end

# After '@pesquisaUndefined' do
#     log 'Apenas no FIM desse Cenarios'
# end
