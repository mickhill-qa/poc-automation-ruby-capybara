[ruby-image]: https://img.shields.io/badge/ruby-2.7.2-red
[ruby-url]: https://www.ruby-lang.org/pt/
[cucumber-image]: https://img.shields.io/badge/cucumber-5.3.0-brightgreen
[cucumber-url]: https://cucumber.io/docs/installation/ruby/
[capybara-image]: https://img.shields.io/badge/capybara-3.35.3-purple
[capybara-url]: https://teamcapybara.github.io/capybara/
[rspec-image]: https://img.shields.io/badge/rspec-3.10.0-red
[rspec-url]: https://rspec.info/documentation/
[site_prism-image]: https://img.shields.io/badge/site_prism-3.7.1-black
[site_prism-url]: https://rdoc.info/gems/site_prism/frames
[report_builder-image]: https://img.shields.io/badge/report_builder-1.9-blue
[report_builder-url]: https://reportbuilder.rajatthareja.com/

# poc-automation-ruby-capybara
[![Ruby Version][ruby-image]][ruby-url]
[![Capybara Version][capybara-image]][capybara-url]
[![Cucumber Version][cucumber-image]][cucumber-url]
[![Rspec Version][rspec-image]][rspec-url]
[![SitePrism Version][site_prism-image]][site_prism-url]
[![ReportBuilder Version][report_builder-image]][report_builder-url]

### Estrutura do projeto
```
./
├── docs/
├── features/
│   ├── hooks/
│   ├── pages/
│   ├── specs/
│   ├── step_definitions/
│   └── support/
│       ├── config/
│       │   └── environments.yml
│       ├── helpers/
│       │   ├── aws_secrets_helper.rb
│       │   ├── page_helper.rb
│       │   └── screenshot_helper.rb
│       ├── env.rb
│       └── report_builder.rb
├── reports/
│   ├── report-builder/
│   └── screenshots/
├── .gitignore
├── cucumber.yml
├── Gemfile
├── Gemfile.lock
└── README.md
```


---
Configurar Ambiente
-------------
Assumimos que você já ***possui o Ruby disponível no terminal***, caso não possua segue um passo a passo.
* [Instalar Ruby](docs/config-env/install-ruby.md)

Instale e configure uma IDE com o **AWS toolkit plugin** para possibilitar o uso do SecretsMenager para guardar as massas de testes do projeto.
* [Instalar AWS toolkit plugin](docs/config-env/install-aws-toolkit-plugin.md)
  
Agora você precisará do **WebDriver** para uso do Browser e do **bundler** para baixar as dependências de pacotes do projeto ruby conforme o arquivo ***"[Gemfile](Gemfile)"***.
* [Instalar WebDriver](docs/config-env/install-webdriver.md)
* [Instalar Bundler](docs/config-env/install-bundler.md)


---
Executar Testes
-------------
Para executar os testes localmente abra a pasta do projeto no terminal e execute o comando:
```
cucumber
```
Ou para um cenário específico:
```
cucumber -t @myTag
```


---
Alterar Ambientes de Execução
-------------
Por padrão os testes irão rodar usando a url de **QA** conforme arquivo "**[environments.yml](features/support/config/environments.yml)**".

Os ambiente disponíveis são:
- dev
- qa
- prod

Para alterar em tempo de execução, adicione o parâmetro "**ENV**" no terminal:
```
cucumber ENV=dev
```
Para alterar o padrão vá até o arquivo "**[cucumber.yml](cucumber.yml)**" e altere a linha 4:
```
default: (...) -p qa
```

---
Caso queira apontar para uma **URL** específica:
```
cucumber URL=http://url-do-ambiente.testes
```

