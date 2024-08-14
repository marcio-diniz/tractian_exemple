import 'package:tractian_exemple/data/models/location_model.dart';
import 'package:tractian_exemple/domain/entities/elementsTree/element_tree_entity.dart';
import 'package:tractian_exemple/domain/entities/elementsTree/assets_tree_entity.dart';
import 'asset_model.dart';
import 'component_model.dart';

class AssetsTreeModel extends AssetsTreeEntity {
  const AssetsTreeModel({required super.elements});

  factory AssetsTreeModel.fromMap({
    required Map<String, dynamic> map,
  }) {
    final locations = map['locations'] as List?;
    final assets = map['assets'] as List?;
    final elemetsTreeModels = <String, ElementTreeEntity>{};
    // generate list components
    final componentsModels = <ComponentModel>[];
    assets?.forEach((component) {
      component as Map<String, dynamic>;
      if (component['sensorId'] != null) {
        final componentModel = ComponentModel.fromMap(component);
        componentsModels.add(componentModel);
      }
    });

    // generate map assets
    final assetModels = <String, AssetModel>{};
    assets?.forEach((asset) {
      asset as Map<String, dynamic>;
      if (asset['sensorId'] == null) {
        final locationModel = AssetModel.fromMap(asset);
        assetModels[locationModel.id] = locationModel;
      }
    });

    // generate map locations
    final locationModels = <String, LocationModel>{};
    locations?.forEach((location) {
      location as Map<String, dynamic>;
      final locationModel = LocationModel.fromMap(location);
      locationModels[locationModel.id] = locationModel;
    });

    // set components in yours maps
    for (final component in componentsModels) {
      if (component.parentId == null) {
        elemetsTreeModels[component.id] = component;
      } else {
        assetModels[component.parentId!]?.childrens[component.id] = component;
      }
    }

    // set assets and subAssets in yours maps
    for (final asset in assetModels.values) {
      if (asset.parentId != null) {
        assetModels[asset.parentId!]?.childrens[asset.id] = asset;
      }
    }

    // set assets in locations
    for (final asset in assetModels.values) {
      if (asset.locationId != null) {
        locationModels[asset.locationId!]?.childrens[asset.id] = asset;
      }
    }

    // set assets in elementsTreeModels
    for (final asset in assetModels.values) {
      if (asset.parentId == null && asset.locationId == null) {
        elemetsTreeModels[asset.id] = asset;
      }
    }

    // set locations and subLocations in yours maps
    for (final location in locationModels.values) {
      if (location.parentId != null) {
        locationModels[location.parentId!]?.childrens[location.id] = location;
      }
    }

    // set locations in elementsTreeModels
    for (final location in locationModels.values) {
      if (location.parentId == null) {
        elemetsTreeModels[location.id] = location;
      }
    }

    return AssetsTreeModel(elements: elemetsTreeModels);
  }
}
