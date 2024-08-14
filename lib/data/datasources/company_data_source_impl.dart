import 'package:tractian_exemple/data/models/company_model.dart';
import 'package:tractian_exemple/infra/services/i_dio_client_service.dart';

import 'interfaces/i_company_data_source.dart';

class CompanyDataSourceImpl implements ICompanyDataSource {
  final IDioClientService clientService;

  CompanyDataSourceImpl({required this.clientService});
  @override
  Future<List<CompanyModel>> getCompaniesList() async {
    try {
      final result = await clientService.get(
          url: 'https://fake-api.tractian.com/companies');

      final companies = result.data;
      if (companies == null) {
        throw Exception();
      }
      final companiesList = <CompanyModel>[];
      for (final company in companies) {
        companiesList.add(CompanyModel.fromMap(company));
      }
      return companiesList;
    } catch (e) {
      throw Exception(e);
    }
  }
}
