# Pegando todos os arquivos que estao dentro do caminho a baixo
Dir[File.join(File.dirname(__FILE__), '../page/*.rb')].each { |file| require file }

# Depois que pegar os arquivos com (_page.rb) estancio todos as suas variaveis
module Page
  def pagina_inicial
    @pagina_inicial = GoogleHome.new
  end
end
