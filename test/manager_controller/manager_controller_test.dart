import 'package:flutter_test/flutter_test.dart';
import 'package:infleet_test/controller/manager_controller.dart';
import 'package:infleet_test/models/plataform.dart';
import 'package:infleet_test/models/vehicle.dart';

void main() {
  group('ManagerController', () {
    test('should add a platform correctly', () {
      final managerController = ManagerController();
      final platform = Plataform(maxX: 5, maxY: 5);

      managerController.plataform = platform;

      expect(managerController.plataform.maxX, equals(5));
      expect(managerController.plataform.maxY, equals(5));
    });

    test('should send commands to the vehicle', () {
      final managerController = ManagerController();
      final platform = Plataform(maxX: 5, maxY: 5);
      managerController.plataform = platform;

      final vehicle = Vehicle(id: 1, x: 1, y: 2, direction: 'N');
      managerController.sendCommands('M', vehicle);

      expect(vehicle.x, equals(1));
      expect(vehicle.y, equals(3));
      expect(vehicle.direction, equals('N'));
    });

    test('should detect collision correctly', () {
      final managerController = ManagerController();
      final platform = Plataform(maxX: 5, maxY: 5);
      managerController.plataform = platform;

      final vehicle1 = Vehicle(id: 1, x: 1, y: 2, direction: 'N');
      final vehicle2 = Vehicle(id: 2, x: 1, y: 3, direction: 'S');

      managerController.vehicles.add(vehicle1);
      managerController.vehicles.add(vehicle2);

      expect(managerController.checkCollision(1, 3), isTrue);
      expect(managerController.checkCollision(0, 0), isFalse);
    });
  });
}
