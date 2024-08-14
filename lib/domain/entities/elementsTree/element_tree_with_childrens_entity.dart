import 'element_tree_entity.dart';

class ElementTreeWithChildrensEntity extends ElementTreeEntity {
  const ElementTreeWithChildrensEntity({
    required super.id,
    required super.name,
    required super.parentId,
    required this.childrens,
  });
  final Map<String, ElementTreeEntity> childrens;

  @override
  String toStringToSearch() =>
      'name: ${name.toUpperCase()} childrens: {${childrens.values.map((e) => e.toStringToSearch())}}';
}
