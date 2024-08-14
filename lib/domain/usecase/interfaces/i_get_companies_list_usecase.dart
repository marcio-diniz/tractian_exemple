import 'package:dartz/dartz.dart';
import 'package:tractian_exemple/domain/entities/company_entity.dart';

abstract class IGetCompaniesListUsecase {
  Future<Either<Exception, List<CompanyEntity>>> call();
}
