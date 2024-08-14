enum SensorType {
  vibration,
  energy,
  undefined;

  static SensorType fromString(String? value) => SensorType.values.firstWhere(
        (e) => e.name == value,
        orElse: () => SensorType.undefined,
      );
}
