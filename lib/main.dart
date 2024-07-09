import 'controller/manager_controller.dart';
import 'services/input_service.dart';

void main() {
  final managerController = ManagerController();
  final inputService = InputService();

  if (!inputService.setPlatformSize(managerController)) return;

  while (true) {
    if (!inputService.addVehicle(managerController)) break;
  }

  inputService.printFinalVehiclePositions(managerController);
}
