import 'package:equatable/equatable.dart';

import '../../domain/entities/company_entity.dart';

enum CompaniesListStatus {
  initial,
  loading,
  error,
  success,
}

class CompaniesListState extends Equatable {
  const CompaniesListState._({
    required this.companies,
    required this.status,
  });

  final List<CompanyEntity> companies;
  final CompaniesListStatus status;

  CompaniesListState.initial()
      : this._(
          companies: [],
          status: CompaniesListStatus.initial,
        );

  @override
  List<Object?> get props => [
        companies,
        status,
      ];

  CompaniesListState copyWith(
          {List<CompanyEntity>? companies, CompaniesListStatus? status}) =>
      CompaniesListState._(
        companies: companies ?? this.companies,
        status: status ?? this.status,
      );
}
