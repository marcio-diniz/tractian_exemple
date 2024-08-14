import 'package:dartz/dartz.dart';
import 'package:tractian_exemple/domain/entities/company_entity.dart';
import 'package:tractian_exemple/domain/usecase/interfaces/i_get_companies_list_usecase.dart';

import '../repositories/i_company_repository.dart';

class GetCompaniesListUsecase implements IGetCompaniesListUsecase {
  GetCompaniesListUsecase({required this.repository});
  final ICompanyRepository repository;

  @override
  Future<Either<Exception, List<CompanyEntity>>> call() async {
    return repository.getCompaniesList();
  }
}
