import '../../domain/entities/company_entity.dart';

class CompanyModel extends CompanyEntity {
  CompanyModel({
    required super.id,
    required super.name,
  });

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
      };

  factory CompanyModel.fromMap(Map<String, dynamic> map) => CompanyModel(
        id: map['id'] as String,
        name: map['name'] as String,
      );
}
