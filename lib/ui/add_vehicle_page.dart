import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/vehicle/vehicle_bloc.dart';
import '../bloc/vehicle/vehicle_event.dart';

import '../models/car.dart';
import '../models/truck.dart';
import '../models/motorcycle.dart';
import '../models/engine.dart';
import '../models/enums.dart';

class AddVehiclePage extends StatefulWidget {
  const AddVehiclePage({super.key});

  @override
  State<AddVehiclePage> createState() => _AddVehiclePageState();
}

class _AddVehiclePageState extends State<AddVehiclePage> {
  final formKey = GlobalKey<FormState>();

  /// ----------------------------
  /// Controllers
  /// ----------------------------
  final companyCtrl = TextEditingController();
  final modelCtrl = TextEditingController();
  final plateCtrl = TextEditingController();
  final bodyCtrl = TextEditingController();
  final colorCtrl = TextEditingController();

  final lengthCtrl = TextEditingController();
  final widthCtrl = TextEditingController();

  /// Engine
  final engineCompanyCtrl = TextEditingController();
  final engineModelCtrl = TextEditingController();
  final capacityCtrl = TextEditingController();
  final cylindersCtrl = TextEditingController();

  /// Car
  final chairCtrl = TextEditingController();

  /// Truck
  final freeWeightCtrl = TextEditingController();
  final fullWeightCtrl = TextEditingController();

  /// Motorcycle
  final tierCtrl = TextEditingController();

  /// ----------------------------
  /// Dropdowns
  /// ----------------------------
  VehicleType selectedType = VehicleType.car;
  GearType selectedGear = GearType.automatic;
  FuelType selectedFuel = FuelType.gasoline;

  bool leatherSeats = false;

  /// ----------------------------
  /// Helpers
  /// ----------------------------
  int toInt(String v) => int.tryParse(v) ?? 0;
  double toDouble(String v) => double.tryParse(v) ?? 0.0;

  String? requiredField(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Required field";
    }
    return null;
  }

  /// ----------------------------
  /// Add Vehicle
  /// ----------------------------
  void submit() {
    if (!formKey.currentState!.validate()) return;

    final engine = Engine(
      manufacture: engineCompanyCtrl.text.trim(),
      manufactureDate: DateTime.now(),
      model: engineModelCtrl.text.trim(),
      capacity: toDouble(capacityCtrl.text),
      cylinders: toInt(cylindersCtrl.text),
      fuelType: selectedFuel,
    );

    if (selectedType == VehicleType.car) {
      final car = Car(
        manufactureCompany: companyCtrl.text.trim(),
        manufactureDate: DateTime.now(),
        model: modelCtrl.text.trim(),
        engine: engine,
        plateNum: toInt(plateCtrl.text),
        gearType: selectedGear,
        bodySerialNum: toInt(bodyCtrl.text),
        length: toDouble(lengthCtrl.text),
        width: toDouble(widthCtrl.text),
        color: colorCtrl.text.trim(),
        chairNum: toInt(chairCtrl.text),
        isFurnitureLeather: leatherSeats,
      );

      context.read<VehicleBloc>().add(AddCarEvent(car));
    }

    else if (selectedType == VehicleType.truck) {
      final truck = Truck(
        manufactureCompany: companyCtrl.text.trim(),
        manufactureDate: DateTime.now(),
        model: modelCtrl.text.trim(),
        engine: engine,
        plateNum: toInt(plateCtrl.text),
        gearType: selectedGear,
        bodySerialNum: toInt(bodyCtrl.text),
        length: toDouble(lengthCtrl.text),
        width: toDouble(widthCtrl.text),
        color: colorCtrl.text.trim(),
        freeWeight: toDouble(freeWeightCtrl.text),
        fullWeight: toDouble(fullWeightCtrl.text),
      );

      context.read<VehicleBloc>().add(AddTruckEvent(truck));
    }

    else {
      final motorcycle = Motorcycle(
        manufactureCompany: companyCtrl.text.trim(),
        manufactureDate: DateTime.now(),
        model: modelCtrl.text.trim(),
        engine: engine,
        plateNum: toInt(plateCtrl.text),
        gearType: selectedGear,
        bodySerialNum: toInt(bodyCtrl.text),
        tierDiameter: toDouble(tierCtrl.text),
        length: toDouble(lengthCtrl.text),
      );

      context.read<VehicleBloc>().add(AddMotorcycleEvent(motorcycle));
    }

    Navigator.pop(context);
  }

  /// ----------------------------
  /// UI
  /// ----------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Vehicle"),
        centerTitle: true,
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            /// Vehicle Type
            DropdownButtonFormField<VehicleType>(
              value: selectedType,
              decoration: const InputDecoration(
                labelText: "Vehicle Type",
                border: OutlineInputBorder(),
              ),
              items: VehicleType.values.map((e) {
                return DropdownMenuItem(
                  value: e,
                  child: Text(e.name.toUpperCase()),
                );
              }).toList(),
              onChanged: (v) {
                setState(() {
                  selectedType = v!;
                });
              },
            ),

            const SizedBox(height: 16),

            buildSectionTitle("General Info"),

            field(companyCtrl, "Company"),
            field(modelCtrl, "Model"),
            field(plateCtrl, "Plate Number", number: true),
            field(bodyCtrl, "Body Serial", number: true),
            field(colorCtrl, "Color"),

            field(lengthCtrl, "Length", number: true),

            if (selectedType != VehicleType.motorcycle)
              field(widthCtrl, "Width", number: true),

            const SizedBox(height: 16),

            /// Gear
            DropdownButtonFormField<GearType>(
              value: selectedGear,
              decoration: const InputDecoration(
                labelText: "Gear Type",
                border: OutlineInputBorder(),
              ),
              items: GearType.values.map((e) {
                return DropdownMenuItem(
                  value: e,
                  child: Text(e.name),
                );
              }).toList(),
              onChanged: (v) {
                setState(() {
                  selectedGear = v!;
                });
              },
            ),

            const SizedBox(height: 20),

            buildSectionTitle("Engine"),

            field(engineCompanyCtrl, "Engine Company"),
            field(engineModelCtrl, "Engine Model"),
            field(capacityCtrl, "Capacity", number: true),
            field(cylindersCtrl, "Cylinders", number: true),

            const SizedBox(height: 12),

            DropdownButtonFormField<FuelType>(
              value: selectedFuel,
              decoration: const InputDecoration(
                labelText: "Fuel Type",
                border: OutlineInputBorder(),
              ),
              items: FuelType.values.map((e) {
                return DropdownMenuItem(
                  value: e,
                  child: Text(e.name),
                );
              }).toList(),
              onChanged: (v) {
                setState(() {
                  selectedFuel = v!;
                });
              },
            ),

            const SizedBox(height: 20),

            buildSectionTitle("Specific Info"),

            if (selectedType == VehicleType.car) ...[
              field(chairCtrl, "Chair Number", number: true),
              SwitchListTile(
                title: const Text("Leather Seats"),
                value: leatherSeats,
                onChanged: (v) {
                  setState(() {
                    leatherSeats = v;
                  });
                },
              ),
            ],

            if (selectedType == VehicleType.truck) ...[
              field(freeWeightCtrl, "Free Weight", number: true),
              field(fullWeightCtrl, "Full Weight", number: true),
            ],

            if (selectedType == VehicleType.motorcycle) ...[
              field(tierCtrl, "Tier Diameter", number: true),
            ],

            const SizedBox(height: 30),

            SizedBox(
              height: 55,
              child: ElevatedButton.icon(
                onPressed: submit,
                icon: const Icon(Icons.add),
                label: const Text(
                  "Add Vehicle",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  /// ----------------------------
  /// Reusable Widgets
  /// ----------------------------
  Widget buildSectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget field(
      TextEditingController controller,
      String label, {
        bool number = false,
      }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        controller: controller,
        keyboardType:
        number ? TextInputType.number : TextInputType.text,
        validator: requiredField,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    companyCtrl.dispose();
    modelCtrl.dispose();
    plateCtrl.dispose();
    bodyCtrl.dispose();
    colorCtrl.dispose();
    lengthCtrl.dispose();
    widthCtrl.dispose();
    engineCompanyCtrl.dispose();
    engineModelCtrl.dispose();
    capacityCtrl.dispose();
    cylindersCtrl.dispose();
    chairCtrl.dispose();
    freeWeightCtrl.dispose();
    fullWeightCtrl.dispose();
    tierCtrl.dispose();
    super.dispose();
  }
}