## Configurando ambiente local

Assumimos que você já ***possui o Ruby disponível no terminal***. Agora você precisará do **ChormeDriver** disponível no terminal e do **bundler** para baixar todas as dependências dos pacotes do projeto, conforme o arquivo **[Gemfile.lock](../Gemfile.lock)**.

---
### Instalar Bundler
Para instalar o bundler executando o seguinte comando no terminal:
```
gem install bundler
```
Para baixar as dependências de pacote deste projeto abra a pasta "**raiz**" no terminal e execute o comando:
```
bundle install
```


---
### Instalar WebDriver
Para configurar o **[ChormeDriver](https://chromedriver.chromium.org/downloads)**...
- No **Windows**: Baixe o arquivo referente a sua versão de navegador e descompacte na pasta ***"C:\Windows"***.
- No **Linux**: Baixe o arquivo referente a sua versão de navegador, descompacte o arquivo, abra o terminal nesta pasta e execute os seguintes comandos:
```
sudo mv chromedriver /usr/bin/chromedriver
sudo chown root:root /usr/bin/chromedriver
sudo chmod +x /usr/bin/chromedriver
```
- No **MacOS**: É possivel instalar via **[Homebrew](https://brew.sh/)** executando o seguinte comando:
```
brew install --cask chromedriver
```


---
### Instalar AWS toolkit plugin
Para utilizar o "**[AWS Secrets Manager](https://docs.aws.amazon.com/pt_br/secretsmanager/latest/userguide/intro.html)**", será necessário instalar o plugin AWS toolkit plugin na IDE utilizada.
- **VSCode**: Para instalar o plugin no Visual Studio Code deve seguir os passos neste link "**[VSCode](https://aws.amazon.com/visualstudiocode/)**".
- **RubyMine**: Para instalar o plugin na Jetbrains deve seguir os passos neste link "**[RubyMine](https://docs.aws.amazon.com/toolkit-for-jetbrains/latest/userguide/setup-toolkit.html)**".



