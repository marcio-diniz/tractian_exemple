abstract class ElementTreeEntity {
  const ElementTreeEntity({
    required this.id,
    required this.name,
    required this.parentId,
  });
  final String id;
  final String name;
  final String? parentId;

  String toStringToSearch();
}
