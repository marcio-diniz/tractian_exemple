import 'package:tractian_exemple/domain/entities/elementsTree/element_tree_entity.dart';

class AssetsTreeEntity {
  const AssetsTreeEntity({
    required this.elements,
  });
  final Map<String, ElementTreeEntity> elements;
}
