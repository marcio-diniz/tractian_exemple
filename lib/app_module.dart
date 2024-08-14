import 'package:flutter_modular/flutter_modular.dart';
import 'package:tractian_exemple/presentation/controllers/assets_tree_cubit.dart';
import 'package:tractian_exemple/presentation/modules/companies_module.dart';
import 'presentation/controllers/companies_list_cubit.dart';
import 'presentation/modules/assets_tree_module.dart';
import 'presentation/modules/core_module.dart';
import 'presentation/screens/assets_page.dart';
import 'presentation/screens/companies_page.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
        CompaniesModule(),
        AssetsTreeModule(),
      ];
  @override
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
  }
}
