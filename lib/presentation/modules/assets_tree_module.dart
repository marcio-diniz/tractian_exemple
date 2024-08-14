import 'package:flutter_modular/flutter_modular.dart';
import 'package:tractian_exemple/domain/usecase/interfaces/i_get_assets_tree_by_company_id_usecase.dart';
import 'package:tractian_exemple/presentation/controllers/assets_tree_cubit.dart';
import 'package:tractian_exemple/presentation/modules/core_module.dart';
import '../../data/datasources/assets_tree_data_source_impl.dart';
import '../../data/datasources/interfaces/i_assets_tree_data_source.dart';
import '../../data/repositories/assets_tree_repository_impl.dart';
import '../../domain/repositories/i_assets_tree_repository.dart';
import '../../domain/usecase/get_assets_tree_by_company_id_usecase.dart';

class AssetsTreeModule extends Module {
  @override
  List<Module> get imports => [CoreModule()];
  @override
  void binds(Injector i) {
    i.add<IAssetsTreeDataSource>(AssetsTreeDataSourceImpl.new);
    i.add<IAssetsTreeRepository>(AssetsTreeRepositoryImpl.new);
    i.add<IGetAssetsTreeByCompanyIdUsecase>(
        GetAssetsTreeByCompanyIdUsecase.new);
    i.add(AssetsTreeCubit.new);
    super.binds(i);
  }
}
