import 'package:tractian_exemple/data/models/assets_tree_model.dart';

abstract class IAssetsTreeDataSource {
  Future<AssetsTreeModel> getAssetsTreeByCompanyId({required String companyId});
}
