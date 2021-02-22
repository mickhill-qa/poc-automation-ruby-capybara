# learning-ruby-capybara

Neste projeto eu utilizei o **Ruby 2.7.2** e os seguintes pacotes:
```
gem  'capybara'
gem  'cucumber'
gem  'rspec'
gem  'selenium-webdriver'
gem  'site_prism'
gem  'report_builder'
gem  'json'
```


## Configurando ambiente local

Assumimos que você já ***possui o Ruby disponível no terminal***. Agora você precisará do **ChormeDriver** disponível no terminal e do **bundler** para baixar todas as dependências dos pacotes do projeto, conforme o arquivo **Gemfile.lock**.

Para instalar o bundler executando o seguinte comando no terminal:
```
gem install bundler
```
Para baixar as dependências de pacote deste projeto abra a pasta "**test/**" no terminal e execute o comando:
```
bundler install
```

Para configurar o [ChormeDriver](https://chromedriver.chromium.org/downloads) baixe o arquivo referente a sua versão de navegador. 
No **Windows**: Descompacte na pasta onde ele irá ficar e adicione-o no PATH do sistema. 
No **Linux/MacOS**: Descompacte o arquivo, abra o terminal nesta pasta e execute os seguintes comandos:
```
sudo mv chromedriver /usr/bin/chromedriver
sudo chown root:root /usr/bin/chromedriver
sudo chmod +x /usr/bin/chromedriver
```


## Executando testes localmente

Execute o comando:
```
cucumber
```
Ou para um cenário específico:
```
cucumber -t @myTag
```


## Alternando execução entre ambientes

Por padrão os testes iram rodar usando a url de **QA** conforme arquivo "**test/features/support/config/environments.yml**". 

Os ambiente disponíveis são:
- dev
- qa
- prod

Para alterar em tempo de execução, adiciona o parâmetro "**ENV**" no terminal:
```
cucumber ENV=dev
```

Para alterar o padrão vá até o arquivo"**test/cucumber.yml**" e altere a linha 4:

```
default: (...) -p qa
```
