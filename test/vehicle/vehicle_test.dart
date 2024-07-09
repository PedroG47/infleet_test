import 'package:flutter_test/flutter_test.dart';
import 'package:infleet_test/models/vehicle.dart';

void main() {
  group('Vehicle', () {
    test('Vehicle movement within bounds', () {
      final vehicle = Vehicle(id: 1, x: 0, y: 0, direction: 'N');
      bool moved = vehicle.vectorMove(5, 5, (x, y) => false);
      expect(moved, true);
      expect(vehicle.x, 0);
      expect(vehicle.y, 1);
    });

    test('Vehicle movement out of bounds', () {
      final vehicle = Vehicle(id: 1, x: 0, y: 0, direction: 'S');
      bool moved = vehicle.vectorMove(5, 5, (x, y) => false);
      expect(moved, false);
      expect(vehicle.x, 0);
      expect(vehicle.y, 0);
    });

    test('Vehicle collision detection', () {
      final vehicle = Vehicle(id: 1, x: 0, y: 0, direction: 'N');
      bool moved = vehicle.vectorMove(5, 5, (x, y) => x == 0 && y == 1);
      expect(moved, false);
      expect(vehicle.x, 0);
      expect(vehicle.y, 0);
    });

    test('Vehicle turning left', () {
      final vehicle = Vehicle(id: 1, x: 0, y: 0, direction: 'N');
      vehicle.turnLeft();
      expect(vehicle.direction, 'O');
    });

    test('Vehicle turning right', () {
      final vehicle = Vehicle(id: 1, x: 0, y: 0, direction: 'N');
      vehicle.turnRight();
      expect(vehicle.direction, 'L');
    });
  });
}
