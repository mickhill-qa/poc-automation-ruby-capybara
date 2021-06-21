## Instalar Ruby


#### **Windows**
Para instalar o Ruby vamos até o site: [RubyInstaller.org / Downloads](https://rubyinstaller.org/downloads/); Baixe o instalador com DevKIT da verão desejada, depois é só *"Next, Next, Install e Finish"*.

Em seguida um **Command Prompt** será aberto: Pressione *Enter* e espere finalizar.


---
#### **Linux**
Para a instalação do Ruby nós vamos usar o **RVM**(*Ruby Version Manager*).
  - **[Install RVM](https://rvm.io/rvm/install)**:
    - Abra o terminal e Instale as chaves GPG usadas para verificar o pacote de instalação executando o seguinte comando:
      ```
      gpg2 --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
      ```
      
    - Em seguida instale o **RVM** executando o seguinte comando:
      ```
      \curl -sSL https://get.rvm.io | bash -s stable --ruby
      ```


---
#### **MacOS**
  Para a instalação do Ruby nós vamos usar o **RVM**(*Ruby Version Manager*) e algumas outras dependência como o **Xcode** e **Homebrew** -> **Wget**.

  - **[Install Xcode](https://apps.apple.com/br/app/xcode/id497799835?mt=12)**: 
    - Abra a *App Store*, procure  e instale o "Xcode";
    - Apos a instalação, *Abra o Xcode e Aceite os Termos*.

  - **[Install Homebrew](https://brew.sh/)** (Wget):
    - Abra o Site do "Homebrew" e *siga as instruções de instalação*;
    - Apos a instalação, abra o terminal e instale o "wget" com o seguinte comando:
      ```
      brew install wget
      ```

  - **[Install RVM](https://rvm.io/rvm/install)**:
    - Abra o terminal e instale o **RVM** executando o seguinte comando:
      ```
      \curl -sSL https://get.rvm.io | bash -s stable --ruby
      ```

---
#### Como usar o RVM? *(Linux e MacOS)*

  - **Visualizar** as versões do Ruby instaladas:
    ```
    rvm list
    ```
  - **Visualizar** outras versões do Ruby **disponiveis para Instalação**:
    ```
    rvm list known
    ```
  - **Instalar** outra versão do Ruby:
    ```
    rvm install 2.7
    ```
  - **Instalar** outra versão do Ruby e já **definir como padrão**:
    ```
    rvm install 2.7@global
    ```
  - **Trocar** a versão padrão instalada do Ruby:
    ```
    rvm use 2.7 --default
    ```
  - **Remover** uma versão instalada do Ruby:
    ```
    rvm remove ruby-3
    ```