# Instalar WebDriver

Abra o site do **[ChormeDriver](https://chromedriver.chromium.org/downloads)** e baixe a versão de acordo com o seu navegador.

---

## **Windows**

- Baixe o arquivo referente a sua versão de navegador;
- Descompacte na pasta ***"C:\Windows"***; Ou crie uma pasta de sua preferência e adicione-a as Variáveis de Ambiente.

---

## **Linux**

Baixe o arquivo referente a sua versão de navegador, descompacte o arquivo, abra o terminal nesta pasta e execute os seguintes comandos:

```bash
sudo mv chromedriver /usr/bin/chromedriver
```

```bash
sudo chown root:root /usr/bin/chromedriver
```

```bash
sudo chmod +x /usr/bin/chromedriver
```

---

## **MacOS**

Descompacte o arquivo, abra o terminal nesta pasta e execute os seguintes comandos:

```bash
sudo mv chromedriver /usr/local/bin
```

```bash
sudo chmod +x /usr/local/bin/chromedriver
```

- Também é possivel instalar via **[Homebrew](https://brew.sh/)** executando o seguinte comando:

    ```bash
    brew install --cask chromedriver
    ```

---

### `gem` **ChromeDriver-Helper** *(Linux e MacOS)*

Caso você esteja usando **Linux** ou **MacOS**
e não quer instalar o WebDriver como nas opções acima,
instale a `gem` **[chromedriver-helper](https://rubygems.org/gems/chromedriver-helper/)**.

Obs.: Não funciona no windows.

Esta pode ser baixada junto com as outras dependências de pacote do [Bundler](install-bundler.md),
sendo necessárias as alterações em dois arquivos; Adicione as seguintes linhas aos arquivos:

***Gemfile***

```ruby
gem 'chromedriver-helper'
```

***env.rb***

```ruby
require 'chromedriver-helper'
```
