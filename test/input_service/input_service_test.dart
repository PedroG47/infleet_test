import 'package:flutter_test/flutter_test.dart';
import 'package:infleet_test/services/input_service.dart';

void main() {
  group('InputService', () {
    final inputService = InputService();

    test('deve validar comandos corretamente', () {
      expect(inputService.isValidCommands('M'), isTrue);
      expect(inputService.isValidCommands('E'), isTrue);
      expect(inputService.isValidCommands('D'), isTrue);
      expect(inputService.isValidCommands('A'), isFalse);
    });

    test('deve validar dimensões corretamente', () {
      expect(inputService.isValidDimension(1), isTrue);
      expect(inputService.isValidDimension(-1), isFalse);
    });

    test('deve analisar dimensões corretamente', () {
      expect(inputService.parseDimensions('5 5'), equals([5, 5]));
      expect(inputService.parseDimensions('5 -5'), isNull);
      expect(inputService.parseDimensions('abc 5'), isNull);
      expect(inputService.parseDimensions('5'), isNull);
    });
  });
}
