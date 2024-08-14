import 'dart:convert';

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
      final result = await clientService.get(
          url:
              'https://raw.githubusercontent.com/tractian/challenges/main/assets/api-data.json');

      final data = jsonDecode(result.data);
      final dataFromCompany = data?[companyId] as Map<String, dynamic>?;
      if (dataFromCompany == null) {
        throw Exception();
      }

      return AssetsTreeModel.fromMap(map: dataFromCompany);
    } catch (e) {
      throw Exception(e);
    }
  }
}
