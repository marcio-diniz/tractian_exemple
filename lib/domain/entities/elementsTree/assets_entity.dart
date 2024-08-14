import 'element_tree_with_childrens_entity.dart';

class AssetEntity extends ElementTreeWithChildrensEntity {
  const AssetEntity({
    required super.id,
    required super.name,
    required super.parentId,
    required super.childrens,
    this.locationId,
  });
  final String? locationId;
}
