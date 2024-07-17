import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'views/home_page.dart';

void main() {
  runApp(const MyApp());

  // final managerController = ManagerController();
  // final inputService = InputService();

  // if (!inputService.setPlatformSize(managerController)) return;

  // while (true) {
  //   if (!inputService.addVehicle(managerController)) break;
  // }

  // inputService.printFinalVehiclePositions(managerController);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Vehicle Manager',
      home: const HomePage(),
    );
  }
}


