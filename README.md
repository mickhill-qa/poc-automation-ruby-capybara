# learning-ruby-capybara

Neste projeto eu utilizei o **Ruby 2.7.2** e os seguintes pacotes:
```
gem 'capybara'
gem 'cucumber'
gem 'json'
gem 'report_builder'
gem 'rspec'
gem 'selenium-webdriver'
gem 'site_prism'
```

Estrutura do projeto:
```
./
├── test/
│   ├── features/
│   │   ├── hooks/
│   │   ├── pages/
│   │   ├── specs/
│   │   ├── step_definitions/
│   │   └── support/
│   │       ├── config/
│   │       │   └── environments.yml
│   │       ├── helpers/
│   │       │   └── screenshot_helper.rb
│   │       └── env.rb
│   ├── results/
│   │   ├── report-builder/
│   │   └── screenshots/
│   └── cucumber.yml
├── .gitignore
├── Gemfile
├── Gemfile.lock
└── README.md
```


## Configurando ambiente local

Assumimos que você já ***possui o Ruby disponível no terminal***. Agora você precisará do **ChormeDriver** disponível no terminal e do **bundler** para baixar todas as dependências dos pacotes do projeto, conforme o arquivo **[Gemfile.lock](https://github.com/mickhill-qa/learning-ruby-capybara/blob/main/Gemfile.lock)**.

Para instalar o bundler executando o seguinte comando no terminal:
```
gem install bundler
```
Para baixar as dependências de pacote deste projeto abra a pasta "**[raiz](https://github.com/mickhill-qa/learning-ruby-capybara/tree/main/)**" no terminal e execute o comando:
```
bundler install
```

Para configurar o **[ChormeDriver](https://chromedriver.chromium.org/downloads)** baixe o arquivo referente a sua versão de navegador. 
No **Windows**: Descompacte na pasta onde ele irá ficar e adicione-o no PATH do sistema. 
No **Linux/MacOS**: Descompacte o arquivo, abra o terminal nesta pasta e execute os seguintes comandos:
```
sudo mv chromedriver /usr/bin/chromedriver
sudo chown root:root /usr/bin/chromedriver
sudo chmod +x /usr/bin/chromedriver
```


## Executando testes localmente

Para executar os testes localmente deste projeto abra a pasta "**[test/](https://github.com/mickhill-qa/learning-ruby-capybara/tree/main/test/)**" no terminal e execute o comando:
```
cucumber
```
Ou para um cenário específico:
```
cucumber -t @myTag
```


## Alternando execução entre ambientes

Por padrão os testes iram rodar usando a url de **QA** conforme arquivo "**[environments.yml](https://github.com/mickhill-qa/learning-ruby-capybara/blob/main/test/features/support/config/environments.yml)**". 

Os ambiente disponíveis são:
- dev
- qa
- prod

Para alterar em tempo de execução, adiciona o parâmetro "**ENV**" no terminal:
```
cucumber ENV=dev
```

Para alterar o padrão vá até o arquivo "**[cucumber.yml](https://github.com/mickhill-qa/learning-ruby-capybara/blob/main/test/cucumber.yml)**" e altere a linha 4:
```
default: (...) -p qa
```
