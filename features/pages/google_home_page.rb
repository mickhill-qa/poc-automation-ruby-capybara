# frozen_string_literal: true

# A classe GoogleHome representa uma pagina da Aplicacao.
class GoogleHome < SitePrism::Page
  set_url ''
  element :input_pesquisa, 'textarea[name=q]'

  def preencher_form_pesq(assunto)
    input_pesquisa.set assunto
  end

  def pesquisar
    input_pesquisa.send_keys :enter
  end
end
