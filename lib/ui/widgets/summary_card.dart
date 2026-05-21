import 'package:flutter/material.dart';
import '../../bloc/vehicle/vehicle_state.dart';

class SummaryCard extends StatelessWidget {
  final VehicleLoaded state;

  const SummaryCard({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            "Total Vehicles: ${state.total}",
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text("Cars: ${state.cars.length}"),
          Text("Trucks: ${state.trucks.length}"),
          Text("Motorcycles: ${state.motorcycles.length}"),
        ],
      ),
    );
  }
}