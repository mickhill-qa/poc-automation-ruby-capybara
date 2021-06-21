### Instalar Ruby
Para configurar o...
- No **Windows**: 

---
- No **Linux**:

---
- No **MacOS**: Para a instalação do Ruby nos vamos usar o **RVM**(*Ruby Version Manager*) e algumas outras dependência como o **Xcode** e **Homebrew** -> **Wget**.

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
    - Abra o terminal e execute o seguinte comando:
      ```
      \curl -sSL https://get.rvm.io | bash -s stable --ruby
      ```