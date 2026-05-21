import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'services/vehicle_api_service.dart';
import 'repository/vehicle_repository.dart';
import 'bloc/vehicle/vehicle_bloc.dart';
import 'bloc/vehicle/vehicle_event.dart';
import 'ui/dashboard_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final repo = VehicleRepository(VehicleApiService());

  runApp(MyApp(repo));
}

class MyApp extends StatelessWidget {
  final VehicleRepository repo;

  const MyApp(this.repo, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => VehicleBloc(repo)..add(LoadVehiclesEvent()),
      child: const MaterialApp(
        home: DashboardPage(),
      ),
    );
  }
}