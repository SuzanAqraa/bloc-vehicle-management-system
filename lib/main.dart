import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/vehicle/vehicle_bloc.dart';
import 'bloc/vehicle/vehicle_event.dart';
import 'bloc/search/search_bloc.dart';
import 'bloc/persistence/persistence_bloc.dart';

import 'repository/vehicle_repository.dart';
import 'repository/storage_service.dart';

import 'screens/home_screen.dart';

void main() {
  final storage = StorageService();
  final repo = VehicleRepository(storage);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => VehicleBloc(repo)..add(LoadVehiclesEvent()),
        ),
        BlocProvider(
          create: (_) => SearchBloc(repo),
        ),
        BlocProvider(
          create: (_) => PersistenceBloc(repo),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}