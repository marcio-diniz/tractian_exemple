import 'package:dartz/dartz.dart';
import 'package:tractian_exemple/data/datasources/interfaces/i_company_data_source.dart';
import 'package:tractian_exemple/domain/entities/company_entity.dart';
import 'package:tractian_exemple/domain/repositories/i_company_repository.dart';

import '../../infra/error/handle_error_repositoty.dart';

class CompanyRepositoryImpl
    with HandleOrErrorRepository
    implements ICompanyRepository {
  CompanyRepositoryImpl({
    required this.dataSource,
  });
  final ICompanyDataSource dataSource;

  @override
  Future<Either<Exception, List<CompanyEntity>>> getCompaniesList() =>
      handleRequestOrErrors<List<CompanyEntity>>(() async {
        return dataSource.getCompaniesList();
      });
}
