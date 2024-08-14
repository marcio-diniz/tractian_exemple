import 'package:tractian_exemple/domain/entities/elementsTree/sensor_status_type.dart';
import 'package:tractian_exemple/domain/entities/elementsTree/sensor_type.dart';

import 'element_tree_entity.dart';

class ComponentEntity extends ElementTreeEntity {
  const ComponentEntity({
    required super.id,
    required super.name,
    required this.gatewayId,
    required this.sensorId,
    required this.sensorType,
    required this.sensorStatusType,
    super.parentId,
    this.locationId,
  });

  final String gatewayId;
  final String sensorId;
  final String? locationId;
  final SensorType sensorType;
  final SensorStatusType sensorStatusType;

  @override
  String toStringToSearch() =>
      'name: ${name.toUpperCase()}, sensorType: ${sensorType.name}, sensorStatusType: ${sensorStatusType.name}';
}
