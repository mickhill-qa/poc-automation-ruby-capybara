class GoogleHome < SitePrism::Page
  set_url ''
  element :input_pesquisa, 'input[name=q]'
  element :txt_resultado, '#result-stats'

  def preencher_form_pesq(assunto)
    input_pesquisa.set assunto
  end
  
  def pesquisar
    input_pesquisa.send_keys :enter
  end
end
