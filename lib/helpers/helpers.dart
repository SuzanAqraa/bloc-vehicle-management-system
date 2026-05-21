import '../models/enums.dart';

GearType parseGearType(dynamic value) {
  if (value == null) return GearType.normal;

  return GearType.values.firstWhere(
        (e) => e.name.toLowerCase() == value.toString().toLowerCase(),
    orElse: () => GearType.normal,
  );
}

FuelType parseFuelType(dynamic value) {
  if (value == null) return FuelType.gasoline;

  return FuelType.values.firstWhere(
        (e) => e.name.toLowerCase() == value.toString().toLowerCase(),
    orElse: () => FuelType.gasoline,
  );
}