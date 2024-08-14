import 'element_tree_with_childrens_entity.dart';

class LocationEntity extends ElementTreeWithChildrensEntity {
  const LocationEntity({
    required super.id,
    required super.name,
    required super.parentId,
    required super.childrens,
    required this.locationId,
  });

  final String? locationId;
}
