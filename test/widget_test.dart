import 'package:flutter_test/flutter_test.dart';
import 'package:infleet_test/controller/manager_controller.dart';
import 'package:infleet_test/models/plataform.dart';
import 'package:infleet_test/models/vehicle.dart';

void main() {
  group('ManagerController Tests', () {
    test('Vehicle movements', () {
      final managerController = ManagerController();

      // Definindo a grade da plataforma
      managerController.plataform = Plataform(maxX: 5, maxY: 5);

      // Criando e enviando comandos para os veículos
      final vehicle1 = Vehicle(id: 1, x: 1, y: 2, direction: 'N');
      final vehicle2 = Vehicle(id: 2, x: 3, y: 3, direction: 'L');

      managerController.sendCommands('EMEMEMEMM', vehicle1);
      managerController.sendCommands('MMDMMDMDDM', vehicle2);

      // Verificando se os veículos estão na posição final correta
      expect(managerController.vehicles[0], Vehicle(id: 1, x: 1, y: 3, direction: 'N'));
      expect(managerController.vehicles[1], Vehicle(id: 2, x: 5, y: 1, direction: 'L'));
    });
  });
}
