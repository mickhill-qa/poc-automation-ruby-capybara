# frozen_string_literal: true

# A classe GoogleResults representa uma pagina da Aplicacao.
class GoogleResults < SitePrism::Page
  set_url ''
  element :txt_resultado, '#result-stats'

  def n_resultados
    text_screen = txt_resultado.text
    vetor_text = text_screen.split
    number_screen = vetor_text[1].gsub('.', '').gsub(',', '')
    number_screen.to_i
  end
end
