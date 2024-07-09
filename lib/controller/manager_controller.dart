import '../models/plataform.dart';
import '../models/vehicle.dart';

class ManagerController {
  final List<Vehicle> vehicles = [];
  Plataform? _plataform;

  Plataform get plataform => _plataform!;
  set plataform(Plataform plataform) => _plataform = plataform;

  sendCommand(String command, Vehicle vehicle) {
    switch (command) {
      case 'M':
        if (!vehicle.vectorMove(
            plataform.maxX, plataform.maxY, checkCollision)) {
          return false;
        }
        break;
      case 'E':
        vehicle.turnLeft();
        break;
      case 'D':
        vehicle.turnRight();
        break;
    }
    return true;
  }

  bool sendCommands(String commands, Vehicle vehicle) {
    for (var command in commands.split('')) {
      bool success = sendCommand(command, vehicle);
      if (!success) {
        print(
            'Movimentação do veículo ${vehicle.id} interrompida devido a possível colisão.');
        return false;
      }
    }
    vehicles.add(vehicle);
    return true;
  }

  bool checkCollision(int x, int y) {
    for (var vehicle in vehicles) {
      if (vehicle.x == x && vehicle.y == y) {
        return true;
      }
    }
    return false;
  }
}
