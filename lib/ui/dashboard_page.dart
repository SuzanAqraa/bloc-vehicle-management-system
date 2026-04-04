import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/vehicle/vehicle_bloc.dart';
import '../bloc/vehicle/vehicle_event.dart';
import '../bloc/vehicle/vehicle_state.dart';
import '../bloc/search/search_bloc.dart';
import '../bloc/search/search_event.dart';
import '../bloc/search/search_state.dart';
import '../models/automobile.dart';
import './vehicle_details_page.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<VehicleBloc>().add(LoadVehiclesEvent());

    return Scaffold(
      appBar: AppBar(title: Text("Dashboard")),
      body: Column(
        children: [
          _summaryBar(context),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: "Search by company",
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                context.read<SearchBloc>().add(SearchByCompanyEvent(value));
              },
            ),
          ),
          Expanded(
            child: BlocBuilder<SearchBloc, SearchState>(
              builder: (context, searchState) {
                return BlocBuilder<VehicleBloc, VehicleState>(
                  builder: (context, state) {
                    List<Automobile> list = [];
                    if (searchState is SearchResults) {
                      list = searchState.results;
                    } else if (state is VehicleLoaded) {
                      list = [...state.motorcycles, ...state.cars, ...state.trucks];
                    }
                    if (list.isEmpty) return Center(child: Text("No vehicles found"));

                    return RefreshIndicator(
                      onRefresh: () async {
                        context.read<VehicleBloc>().add(LoadVehiclesEvent());
                      },
                      child: ListView.builder(
                        itemCount: list.length,
                        itemBuilder: (context, index) {
                          final vehicle = list[index];
                          return ListTile(
                            title: Text("${vehicle.manufactureCompany} - ${vehicle.model}"),
                            subtitle: Text("Plate: ${vehicle.plateNum}"),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => VehicleDetailPage(vehicle: vehicle),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _summaryBar(BuildContext context) {
    final state = context.watch<VehicleBloc>().state;
    if (state is VehicleLoaded) {
      final total = state.motorcycles.length + state.cars.length + state.trucks.length;
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Total: $total"),
            Text("Motorcycles: ${state.motorcycles.length}"),
            Text("Cars: ${state.cars.length}"),
            Text("Trucks: ${state.trucks.length}"),
          ],
        ),
      );
    }
    return SizedBox.shrink();
  }
}