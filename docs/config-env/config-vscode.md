# Configurar VS Code

Na loja de extensões do VS Code procure e instale os seguintes plugins:

```text
Ruby
```

```text
Ruby Runner
```

```text
Ruby Language Colorization
```

```text
Ruby Solargraph
```

```text
Ruby Haml
```

```text
Cucumber (Gherkin) Full Support 
```

```text
Snippets and Syntax Highlight for Gherkin (Cucumber) 
```

```text
Gherkin Indent
```

```text
vscode-icons 
```

---

## Depois de [Instalar o Bundler](install-bundler.md) e as extensões acima

Abra a pasta deste projeto no terminal e altere o **Gemfile** execute o comando:

```bash
bundle config set --local gemfile Gemfile.local
```

### Enseguida baixe novamente as dependências

```bash
bundle install
```
