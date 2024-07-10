# 🤖 Infleet em Marte

Este projeto simula o controle de veículos autônomos da Tesla em Marte, em parceria com a SpaceX. Os veículos navegam por uma plataforma retangular, enviando informações sobre o terreno para a Terra. O controle é feito por coordenadas e comandos simples.

## Primeiros Passos

- Clone o repositório:

```bash
https://github.com/PedroG47/infleet_test.git
```

## Uso

- Execute a aplicação:

```bash
dart run lib/main.dart
```

## Testes

- Para rodar os testes:

```bash
flutter test
```

## Estrutura
O projeto está estruturado da seguinte forma:

- lib/models/: Contém os modelos de dados (Vehicle and Plataform).
- lib/controller/: Contém a lógica principal do negócio (ManagerController).
- lib/services/: Lida com operações de input e output (InputService).
- test/: Contém os arquivos de teste.
