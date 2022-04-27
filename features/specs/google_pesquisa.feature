#language: pt
@pesquisa_google
Funcionalidade: Google Pesquisa

  Contexto:
    Dado que eu esteja na pagina inicial

  @pesquisa_google_baseflow
  Cenario: Pesquisa Valida
    Quando eu pesquisar por "um assunto"
    Entao me retorna os resultados indexados

  @pesquisa_google_execao_01
  Cenario: Pesquisa vazia
    Quando eu pesquisar sem preencher o assunto
    Entao continuarei na mesma pagian aguardando um assunto
