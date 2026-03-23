import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/vehicle/vehicle_bloc.dart';
import '../bloc/vehicle/vehicle_state.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Vehicles')),
      body: BlocBuilder<VehicleBloc, VehicleState>(
        builder: (context, state) {
          if (state is VehicleLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (state is VehicleLoaded) {
            return ListView(
              children: [
                ...state.cars.map((c) => ListTile(
                  title: Text("Car: ${c.model}"),
                  subtitle: Text("Plate: ${c.plateNum}"),
                )),
                ...state.trucks.map((t) => ListTile(
                  title: Text("Truck: ${t.model}"),
                  subtitle: Text("Plate: ${t.plateNum}"),
                )),
                ...state.motorcycles.map((m) => ListTile(
                  title: Text("Motorcycle: ${m.model}"),
                  subtitle: Text("Plate: ${m.plateNum}"),
                )),
              ],
            );
          }

          return Center(child: Text("No Data"));
        },
      ),
    );
  }
}