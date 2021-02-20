Dado('que eu esteja na pagina inicial') do
  pagina_inicial.load
  expect(page.current_url).to eql(BASE_URL)
  screenshot
end

Quando('eu pesquisar por {string}') do |text_pesq|
  pagina_inicial.preencher_form_pesq(text_pesq)
  screenshot
  pagina_inicial.pesquisar
end

Entao('me retorna os resultados indexados') do
  expect(page).to have_content 'Aproximadamente '
  screenshot
end

Quando('eu pesquisar sem preencher o assunto') do
  pagina_inicial.preencher_form_pesq('')
end

Entao('continuarei na mesma pagian aguardando um assunto') do
  expect(page.current_url).to eql(BASE_URL)
end
