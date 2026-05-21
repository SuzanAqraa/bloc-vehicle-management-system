import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/vehicle/vehicle_bloc.dart';
import '../bloc/vehicle/vehicle_event.dart';
import '../bloc/vehicle/vehicle_state.dart';

import 'add_vehicle_page.dart';
import 'vehicle_details_page.dart';

import '../models/automobile.dart';
import '../models/car.dart';
import '../models/truck.dart';
import '../models/motorcycle.dart';

// widgets
import 'widgets/summary_card.dart';
import 'widgets/vehicle_tile.dart';
import 'widgets/section_header.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Vehicle Dashboard"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const AddVehiclePage(),
                ),
              );
            },
          )
        ],
      ),

      body: BlocConsumer<VehicleBloc, VehicleState>(
        listener: (context, state) {
          if (state is VehicleError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }
        },

        builder: (context, state) {
          if (state is VehicleLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is VehicleLoaded) {
            return RefreshIndicator(
              onRefresh: () async {
                context.read<VehicleBloc>().add(LoadVehiclesEvent());
              },
              child: ListView(
                padding: const EdgeInsets.only(bottom: 20),
                children: [
                  // 📊 Summary
                  SummaryCard(state: state),

                  // 🚗 Cars
                  if (state.cars.isNotEmpty) ...[
                    const SectionHeader(title: "🚗 Cars"),
                    ...state.cars.map(
                          (c) => VehicleTile(vehicle: c),
                    ),
                  ],

                  // 🚛 Trucks
                  if (state.trucks.isNotEmpty) ...[
                    const SectionHeader(title: "🚛 Trucks"),
                    ...state.trucks.map(
                          (t) => VehicleTile(vehicle: t),
                    ),
                  ],

                  // 🏍️ Motorcycles
                  if (state.motorcycles.isNotEmpty) ...[
                    const SectionHeader(title: "🏍️ Motorcycles"),
                    ...state.motorcycles.map(
                          (m) => VehicleTile(vehicle: m),
                    ),
                  ],
                ],
              ),
            );
          }

          // 🟡 Initial / fallback
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (state is VehicleError)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Text(
                      state.message,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),

                ElevatedButton(
                  onPressed: () {
                    context.read<VehicleBloc>().add(LoadVehiclesEvent());
                  },
                  child: const Text("Load Vehicles"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}