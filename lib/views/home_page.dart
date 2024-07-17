import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infleet_test/controller/manager_controller.dart';
import 'package:infleet_test/models/vehicle.dart';

import '../models/plataform.dart';
import '../services/input_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final service = InputService();
  final managerController = ManagerController();
  final vehicleController = TextEditingController();
  final commandController = TextEditingController();

  String? isValidSize(String? value) {
    if (value == null) return 'Informe um valor para a plataforma.';
  }

  changeSize(String? value) {
    if (value == null) return;
    final dimensions = service.parseDimensions(value);

    if (dimensions == null) return;

    final maxX = dimensions[0];
    final maxY = dimensions[1];

    if (!service.isValidDimension(maxX) || !service.isValidDimension(maxY)) {
      print('Dimensões da plataforma devem ser números positivos.');
      return;
    }

    managerController.plataform = Plataform(maxX: maxX, maxY: maxY);
    setState(() {});
  }

  addVehicle() {
    final vehicle = buildVehicle();
    if (vehicle == null) return;

    final commands = commandController.text;

    if (commands.isNotEmpty) {
      managerController.sendCommands(commands, vehicle);
    }

    vehicleController.clear();
    commandController.clear();
    setState(() {});
  }

  Vehicle? buildVehicle() {
    return service.buildVehicle(
        vehicleController.text, managerController.vehicles);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.fromLTRB(16, 30, 16, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomTextFormField(
                text: 'Size',
                onChanged: changeSize,
              ),
              Text('Tamanho da plataforma: ${managerController.plataform}'),
              Text('Posição final:'),
              // Expanded(
              //   child: ListView.builder(
              //     itemCount: managerController.vehicles.length,
              //     itemBuilder: (context, index) {
              //       final vehicle = managerController.vehicles[index];
              //       return Text('Veículo ${managerController.vehicles[index]}');
              //     },
              //   ),
              // ),
              Expanded(
                  child: GridView.count(
                crossAxisCount: managerController.plataform?.maxX ?? 2,
                children: [
                  for (var y = (managerController.plataform?.maxY  ?? 2) - 1;
                        y >= 0 ;
                        y--)
                  for (var x = 0;
                      x < (managerController.plataform?.maxX ?? 2);
                      x++)
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                        ),
                        child: Container(color: Colors.blue,
                          child: Builder(
                            builder: (context) {
                              //Pegar a  posição final veiculo
                              for(final vehicle in managerController.vehicles) {
                                if((vehicle.x - 1) == x && (vehicle.y - 1) == y){
                                  return Container(
                                    color: Colors.red,
                                  );
                                }
                              }
                              //Color na posição do veiculo 
                              //managerController.vehicles
                              return Text('(${x + 1},${y + 1})',
                              );
                            }
                          )
                        )
                      )
                ],

              )),
              CustomTextFormField(
                text: 'Posição inicial',
                controller: vehicleController,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                text: 'Comandos',
                controller: commandController,
              ),
              const SizedBox(height: 16),
              FilledButton(
                  onPressed: addVehicle, child: Text('Adicionar veículo'))
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.text,
      this.validator,
      this.onChanged,
      this.controller});

  final String? text;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      onChanged: onChanged,
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        labelText: text,
      ),
    );
  }
}
