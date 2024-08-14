import 'package:tractian_exemple/infra/services/i_dio_client_service.dart';

import '../models/assets_tree_model.dart';
import 'interfaces/i_assets_tree_data_source.dart';

class AssetsTreeDataSourceImpl implements IAssetsTreeDataSource {
  final IDioClientService clientService;

  AssetsTreeDataSourceImpl({required this.clientService});
  @override
  Future<AssetsTreeModel> getAssetsTreeByCompanyId({
    required String companyId,
  }) async {
    try {
      final resultLocations = await clientService.get(
          url: 'https://fake-api.tractian.com/companies/$companyId/locations');

      final locations = resultLocations.data;
      final resultAssets = await clientService.get(
          url: 'https://fake-api.tractian.com/companies/$companyId/assets');

      final assets = resultAssets.data;

      if (locations == null && assets == null) {
        throw Exception();
      }

      return AssetsTreeModel.fromMap(
          map: {'locations': locations, 'assets': assets});
    } catch (e) {
      throw Exception(e);
    }
  }
}
