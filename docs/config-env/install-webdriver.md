## Instalar WebDriver
Para configurar o **[ChormeDriver](https://chromedriver.chromium.org/downloads)**...
- No **Windows**: Baixe o arquivo referente a sua versão de navegador e descompacte na pasta ***"C:\Windows"***.
  
---
- No **Linux**: Baixe o arquivo referente a sua versão de navegador, descompacte o arquivo, abra o terminal nesta pasta e execute os seguintes comandos:
    ```
    sudo mv chromedriver /usr/bin/chromedriver
    sudo chown root:root /usr/bin/chromedriver
    sudo chmod +x /usr/bin/chromedriver
    ```

---
- No **MacOS**: É possivel instalar via **[Homebrew](https://brew.sh/)** executando o seguinte comando:
    ```
    brew install --cask chromedriver
    ```
