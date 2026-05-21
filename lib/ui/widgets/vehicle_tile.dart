import 'package:flutter/material.dart';
import '../../models/automobile.dart';
import '../../models/car.dart';
import '../../models/truck.dart';
import '../../models/motorcycle.dart';
import '../vehicle_details_page.dart';

class VehicleTile extends StatelessWidget {
  final Automobile vehicle;

  const VehicleTile({super.key, required this.vehicle});

  @override
  Widget build(BuildContext context) {
    IconData icon;

    if (vehicle is Car) {
      icon = Icons.directions_car;
    } else if (vehicle is Truck) {
      icon = Icons.local_shipping;
    } else {
      icon = Icons.motorcycle;
    }

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(vehicle.model),
        subtitle: Text(vehicle.manufactureCompany),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => VehicleDetailPage(vehicle: vehicle),
            ),
          );
        },
      ),
    );
  }
}