import 'dart:io';
import '../controller/manager_controller.dart';
import '../models/plataform.dart';
import '../models/vehicle.dart';

class InputService {
  List<String> validDirections = ['N', 'L', 'S', 'O'];
  List<String> validCommands = ['M', 'E', 'D'];

  bool setPlatformSize(ManagerController managerController) {
    print('Informe o tamanho da plataforma (maxX maxY):');
    final platformSize = stdin.readLineSync();

    if (platformSize == null) {
      print('Entrada inválida para o tamanho da plataforma.');
      return false;
    }

    final dimensions = parseDimensions(platformSize);
    if (dimensions == null) {
      print('Entrada inválida para o tamanho da plataforma.');
      return false;
    }

    final maxX = dimensions[0];
    final maxY = dimensions[1];

    if (!isValidDimension(maxX) || !isValidDimension(maxY)) {
      print('Dimensões da plataforma devem ser números positivos.');
      return false;
    }

    managerController.plataform = Plataform(maxX: maxX, maxY: maxY);
    return true;
  }

  List<int>? parseDimensions(String input) {
    final parts = input.split(' ');
    if (parts.length != 2) return null;

    final x = int.tryParse(parts[0]);
    final y = int.tryParse(parts[1]);

    if (x == null || y == null || x < 0 || y < 0) return null;

    return [x, y];
  }

  bool isValidDimension(int value) {
    return value > 0;
  }

  bool addVehicle(ManagerController managerController) {
    final vehicle = getVehicleDetails(managerController);
    if (vehicle == null) return false;

    final commands = getVehicleCommands();
    if (commands != null) {
      managerController.sendCommands(commands, vehicle);
    }
    return true;
  }

  Vehicle? getVehicleDetails(ManagerController managerController) {
    print(
        'Informe a posição inicial do veículo (x y direção) ou "sair" para mostrar o relatório final:');
    final positionInput = stdin.readLineSync();
    if (positionInput == 'sair') return null;

    if (positionInput != null) {
      final position = positionInput.split(' ');
      if (position.length == 3) {
        final x = int.tryParse(position[0]);
        final y = int.tryParse(position[1]);
        final direction = position[2].toUpperCase();

        if (x != null && y != null && validDirections.contains(direction)) {
          return Vehicle(
            id: managerController.vehicles.length + 1,
            x: x,
            y: y,
            direction: direction,
          );
        }
      }
    }

    print('Entrada inválida para a posição inicial do veículo.');
    return getVehicleDetails(managerController);
  }

  String? getVehicleCommands() {
    print('Informe os comandos para o veículo:');
    final commands = stdin.readLineSync();

    if (commands != null && isValidCommands(commands)) {
      return commands;
    }

    print('Comandos inválidos. Por favor, use apenas M, E, D.');
    return getVehicleCommands();
  }

  bool isValidCommands(String commands) {
    return commands
        .split('')
        .every((command) => validCommands.contains(command));
  }

  void printFinalVehiclePositions(ManagerController managerController) {
    print('Movimentação final dos veículos:');
    for (var vehicle in managerController.vehicles) {
      print(vehicle.info);
    }
  }
}
