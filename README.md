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

# learning-ruby-capybara
[![Ruby Version][ruby-image]][ruby-url]
[![Capybara Version][capybara-image]][capybara-url]
[![Cucumber Version][cucumber-image]][cucumber-url]
[![Rspec Version][rspec-image]][rspec-url]
[![SitePrism Version][site_prism-image]][site_prism-url]
[![ReportBuilder Version][report_builder-image]][report_builder-url]

### Estrutura do projeto
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
│   │       │   ├── aws_secrets_helper.rb
│   │       │   ├── page_helper.rb
│   │       │   └── screenshot_helper.rb
│   │       ├── env.rb
│   │       └── report_builder.rb
│   ├── reports/
│   │   ├── report-builder/
│   │   └── screenshots/
│   └── cucumber.yml
├── .gitignore
├── Gemfile
├── Gemfile.lock
└── README.md
```

* [Configurando ambiente local](docs/config-env.md)
    * Instalar Bundler
    * Instalar WebDriver
    * Instalar AWS toolkit plugin

* [Executando testes localmente](docs/exec-test.md)