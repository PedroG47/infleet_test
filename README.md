# 🤖 Infleet em Marte

Este projeto simula o controle de veículos autônomos da Tesla em Marte, em parceria com a SpaceX. Os veículos navegam por uma plataforma retangular, enviando informações sobre o terreno para a Terra. O controle é feito por coordenadas e comandos simples.

## Getting Started

- Clone the repository:

```bash
https://github.com/PedroG47/infleet_test.git
```

## Usage

- Run the application:

```bash
dart run lib/main.dart
```

## Testing

- To run tests

```bash
flutter test
```

## Structure
The project is structured as follows:

- lib/models/: Contains the data models (Vehicle and Plataform).
- lib/controller/: Contains the main business logic (ManagerController).
- lib/services/: Handles input and output operations (InputService).
- test/: Contains the test files 
