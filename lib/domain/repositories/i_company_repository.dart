import 'package:dartz/dartz.dart';

import '../entities/company_entity.dart';

abstract class ICompanyRepository {
  Future<Either<Exception, List<CompanyEntity>>> getCompaniesList();
}
