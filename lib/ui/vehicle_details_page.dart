import 'package:bloc_task/models/car.dart';
import 'package:bloc_task/models/motorcycle.dart';
import 'package:bloc_task/models/truck.dart';
import 'package:bloc_task/models/vehicle.dart';
import 'package:flutter/material.dart';
import '../models/automobile.dart';

class VehicleDetailPage extends StatelessWidget {
  final Automobile vehicle;
  const VehicleDetailPage({Key? key, required this.vehicle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Vehicle Details")),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            Text("Manufacture Company: ${vehicle.manufactureCompany}"),
            Text("Model: ${vehicle.model}"),
            Text("Plate Number: ${vehicle.plateNum}"),
            Text("Body Serial: ${vehicle.bodySerialNum}"),
            Text("Manufacture Date: ${vehicle.manufactureDate}"),
            Text("Gear Type: ${vehicle.gearType}"),
            Text("Engine: ${vehicle.engine.model}"),
            if (vehicle is Motorcycle)
              Text("Tier Diameter: ${(vehicle as Motorcycle).tierDiameter}"),
            if (vehicle is Motorcycle)
              Text("Length: ${(vehicle as Motorcycle).length}"),
            if (vehicle is Car)
              Text("Chair Num: ${(vehicle as Car).chairNum}"),
            if (vehicle is Car)
              Text("Furniture Leather: ${(vehicle as Car).isFurnitureLeather}"),
            if (vehicle is Truck)
              Text("Free Weight: ${(vehicle as Truck).freeWeight}"),
            if (vehicle is Truck)
              Text("Full Weight: ${(vehicle as Truck).fullWeight}"),
            if (vehicle is Vehicle)
              Text("Color: ${(vehicle as Vehicle).color}"),
            if (vehicle is Vehicle)
              Text("Width: ${(vehicle as Vehicle).width}"),
            if (vehicle is Vehicle)
              Text("Length: ${(vehicle as Vehicle).length}"),
          ],
        ),
      ),
    );
  }
}