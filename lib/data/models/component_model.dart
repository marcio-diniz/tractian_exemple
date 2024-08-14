import 'package:tractian_exemple/domain/entities/elementsTree/sensor_type.dart';

import '../../domain/entities/elementsTree/component_entity.dart';
import '../../domain/entities/elementsTree/sensor_status_type.dart';

class ComponentModel extends ComponentEntity {
  const ComponentModel({
    required super.id,
    required super.name,
    required super.parentId,
    required super.gatewayId,
    required super.sensorId,
    required super.sensorType,
    required super.sensorStatusType,
  });

  factory ComponentModel.fromMap(Map<String, dynamic> map) => ComponentModel(
        id: map['id'] as String,
        name: map['name'],
        parentId: map['parentId'],
        gatewayId: map['gatewayId'],
        sensorId: map['sensorId'],
        sensorType: SensorType.fromString(map['sensorType']),
        sensorStatusType: SensorStatusType.fromString(map['status']),
      );
}
