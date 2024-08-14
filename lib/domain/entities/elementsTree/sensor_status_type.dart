enum SensorStatusType {
  alert,
  operating,
  undefined;

  static SensorStatusType fromString(String? value) =>
      SensorStatusType.values.firstWhere(
        (e) => e.name == value,
        orElse: () => SensorStatusType.undefined,
      );
}
