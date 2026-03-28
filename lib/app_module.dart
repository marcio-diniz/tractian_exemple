import 'package:flutter_modular/flutter_modular.dart';
import 'package:tractian_exemple/data/datasources/company_data_source_impl.dart';
import 'package:tractian_exemple/data/repositories/company_repository_impl.dart';
import 'package:tractian_exemple/infra/services/client_http_service.dart';
import 'package:tractian_exemple/presentation/controllers/assets_tree_cubit.dart';
import 'package:tractian_exemple/presentation/modules/companies_module.dart';
import 'data/datasources/interfaces/i_assets_tree_data_source.dart';
import 'data/datasources/interfaces/i_company_data_source.dart';
import 'domain/repositories/i_assets_tree_repository.dart';
import 'domain/repositories/i_company_repository.dart';
import 'domain/usecase/get_companies_list_usecase.dart';
import 'domain/usecase/interfaces/i_get_assets_tree_by_company_id_usecase.dart';
import 'domain/usecase/interfaces/i_get_companies_list_usecase.dart';
import 'infra/services/i_dio_client_service.dart';
import 'presentation/controllers/companies_list_cubit.dart';
import 'presentation/screens/assets_page.dart';
import 'presentation/screens/companies_page.dart';

class AppModule extends Module {
/*   @override
  List<Module> get imports => [
        CoreModule(),
        CompaniesModule(),
        AssetsTreeModule(),
      ];
 */

  @override
  // TODO: implement binds
  List<Bind<Object>> get binds => [
        Bind<IDioClientService>((i) => DioClientService()),
        Bind<ICompanyDataSource>(
            (i) => CompanyDataSourceImpl(clientService: i.get())),
        Bind<ICompanyRepository>(
            (i) => CompanyRepositoryImpl(dataSource: i.get())),
        Bind<IGetCompaniesListUsecase>(
            (i) => GetCompaniesListUsecase(repository: i.get())),
        Bind<CompaniesListCubit>(
            (i) => CompaniesListCubit(getCompaniesListUseCase: i.get())),
        /*   Bind<IAssetsTreeDataSource>((i) => i.get()),
        Bind<IAssetsTreeRepository>((i) => i.get()),
        Bind<IGetAssetsTreeByCompanyIdUsecase>((i) => i.get()),
        Bind<AssetsTreeCubit>((i) => AssetsTreeCubit(
            getAssetsTreeByCompanyIdUsecase:
                i.get<IGetAssetsTreeByCompanyIdUsecase>())),
      */
      ];
  @override
  List<ModularRoute> get routes => [
        RedirectRoute('/', to: '/companies/'),
        ChildRoute(
          '/companies/',
          child: (context, args) => CompaniesPage(
            companiesListCubit: Modular.get<CompaniesListCubit>(),
          ),
        ),
        ChildRoute('/assets/',
            child: (context, args) => AssetsPage(
                  assetsTreeCubit: Modular.get<AssetsTreeCubit>(),
                  companyId: args.params['id'] as String,
                  companyName: args.params['name'] as String,
                )),
      ];

/*   @override
  void routes(RouteManager r) {
    r.redirect('/', to: '/companies/');
    r.child('/companies/',
        child: (context) => CompaniesPage(
              companiesListCubit: Modular.get<CompaniesListCubit>(),
            ));
    r.child('/companies/:id/:name/',
        child: (context) => AssetsPage(
              assetsTreeCubit: Modular.get<AssetsTreeCubit>(),
              companyId: r.args.params['id'] as String,
              companyName: r.args.params['name'] as String,
            ));
    super.routes(r);
  } */
}
