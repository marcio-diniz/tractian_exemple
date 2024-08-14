import 'package:tractian_exemple/domain/entities/elementsTree/location_entity.dart';

class LocationModel extends LocationEntity {
  const LocationModel({
    required super.id,
    required super.name,
    required super.parentId,
    required super.locationId,
    required super.childrens,
  });
  factory LocationModel.fromMap(Map<String, dynamic> map) => LocationModel(
        id: map['id'] as String,
        name: map['name'] as String,
        parentId: map['parentId'] as String?,
        locationId: map['locationId'] as String?,
        childrens: {},
      );
}
