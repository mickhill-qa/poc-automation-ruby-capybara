## Executando testes localmente

Para executar os testes localmente deste projeto abra a pasta "**[test/](../test/)**" no terminal e execute o comando:
```
cucumber
```
Ou para um cenário específico:
```
cucumber -t @myTag
```


---
## Alternando execução entre ambientes

Por padrão os testes iram rodar usando a url de **DEV** conforme arquivo "**[environments.yml](../test/features/support/config/environments.yml)**".

Os ambiente disponíveis são:
- dev
- qa
- prod

Para alterar em tempo de execução, adiciona o parâmetro "**ENV**" no terminal:
```
cucumber ENV=qa
```

Para alterar o padrão vá até o arquivo "**[cucumber.yml](../test/cucumber.yml)**" e altere a linha 4:
```
default: (...) -p dev
```
