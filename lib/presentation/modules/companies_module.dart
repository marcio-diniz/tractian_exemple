import 'package:flutter_modular/flutter_modular.dart';
import 'package:tractian_exemple/data/repositories/company_repository_impl.dart';
import 'package:tractian_exemple/domain/repositories/i_company_repository.dart';
import 'package:tractian_exemple/domain/usecase/get_companies_list_usecase.dart';
import 'package:tractian_exemple/presentation/modules/core_module.dart';
import '../../domain/usecase/interfaces/i_get_companies_list_usecase.dart';
import '../../data/datasources/company_data_source_impl.dart';
import '../../data/datasources/interfaces/i_company_data_source.dart';
import '/presentation/controllers/companies_list_cubit.dart';

class CompaniesModule extends Module {
  @override
  List<Module> get imports => [CoreModule()];
  @override
  void binds(Injector i) {
    i.add<ICompanyDataSource>(CompanyDataSourceImpl.new);
    i.add<ICompanyRepository>(CompanyRepositoryImpl.new);
    i.add<IGetCompaniesListUsecase>(GetCompaniesListUsecase.new);

    i.add(CompaniesListCubit.new);
    super.binds(i);
  }
}
