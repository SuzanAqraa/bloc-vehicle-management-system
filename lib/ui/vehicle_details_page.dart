import 'package:flutter/material.dart';
import '../models/automobile.dart';
import '../models/car.dart';
import '../models/truck.dart';
import '../models/motorcycle.dart';
import 'widgets/section_card.dart';
import 'widgets/info_row.dart';

class VehicleDetailPage extends StatelessWidget {
  final Automobile vehicle;

  const VehicleDetailPage({super.key, required this.vehicle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Vehicle Details"),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          SectionCard(
            title: "General Information",
            icon: Icons.directions_car,
            children: [
              InfoRow(label: "Company", value: vehicle.manufactureCompany),
              InfoRow(label: "Model", value: vehicle.model),
              InfoRow(label: "Plate Number", value: vehicle.plateNum.toString()),
              InfoRow(label: "Body Serial", value: vehicle.bodySerialNum.toString()),
              InfoRow(label: "Gear Type", value: vehicle.gearType.name),
              InfoRow(
                label: "Manufacture Date",
                value: vehicle.manufactureDate.toIso8601String().split("T").first,
              ),
            ],
          ),

          const SizedBox(height: 12),

          SectionCard(
            title: "Engine",
            icon: Icons.settings,
            children: [
              InfoRow(label: "Model", value: vehicle.engine.model),
              InfoRow(label: "Capacity", value: "${vehicle.engine.capacity} cc"),
              InfoRow(label: "Cylinders", value: vehicle.engine.cylinders.toString()),
              InfoRow(label: "Fuel Type", value: vehicle.engine.fuelType.name),
            ],
          ),

          const SizedBox(height: 12),

          SectionCard(
            title: "Specifications",
            icon: Icons.category,
            children: _buildSpecificFields(vehicle),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildSpecificFields(Automobile vehicle) {
    if (vehicle is Car) {
      return [
        InfoRow(label: "Seats", value: vehicle.chairNum.toString()),
        InfoRow(label: "Leather Interior", value: vehicle.isFurnitureLeather ? "Yes" : "No"),
        InfoRow(label: "Color", value: vehicle.color),
        InfoRow(label: "Length", value: "${vehicle.length} cm"),
        InfoRow(label: "Width", value: "${vehicle.width} cm"),
      ];
    }

    if (vehicle is Truck) {
      return [
        InfoRow(label: "Free Weight", value: "${vehicle.freeWeight} kg"),
        InfoRow(label: "Full Weight", value: "${vehicle.fullWeight} kg"),
        InfoRow(label: "Color", value: vehicle.color),
        InfoRow(label: "Length", value: "${vehicle.length} cm"),
        InfoRow(label: "Width", value: "${vehicle.width} cm"),
      ];
    }

    if (vehicle is Motorcycle) {
      return [
        InfoRow(label: "Tire Diameter", value: vehicle.tierDiameter.toString()),
        InfoRow(label: "Length", value: "${vehicle.length} cm"),
      ];
    }

    return [
      const Text("No specific data available"),
    ];
  }
}