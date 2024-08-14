import 'package:flutter/material.dart';

import '../../../domain/entities/elementsTree/assets_entity.dart';
import '../../../domain/entities/elementsTree/component_entity.dart';
import '../../../domain/entities/elementsTree/element_tree_entity.dart';
import '../../../domain/entities/elementsTree/location_entity.dart';
import 'asset_content_widget.dart';
import 'component_content_widget.dart';
import 'location_content_widget.dart';

class AssetTreeWidgetFactory {
  static Widget createWidget(ElementTreeEntity entity) {
    if (entity is LocationEntity) {
      return LocationContentWidget(locationEntity: entity);
    } else if (entity is AssetEntity) {
      return AssetContentWidget(assetEntity: entity);
    } else if (entity is ComponentEntity) {
      return ComponentContentWidget(componentEntity: entity);
    } else {
      return const SizedBox.shrink();
    }
  }
}
