import '../../domain/entities/elementsTree/assets_entity.dart';

class AssetModel extends AssetEntity {
  const AssetModel({
    required super.id,
    required super.name,
    required super.parentId,
    required super.childrens,
    required super.locationId,
  });
  factory AssetModel.fromMap(Map<String, dynamic> map) => AssetModel(
        id: map['id'] as String,
        name: map['name'] as String,
        parentId: map['parentId'] as String?,
        locationId: map['locationId'] as String?,
        childrens: {},
      );
}
