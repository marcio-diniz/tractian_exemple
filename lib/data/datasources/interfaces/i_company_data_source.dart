import '../../models/company_model.dart';

abstract class ICompanyDataSource {
  Future<List<CompanyModel>> getCompaniesList();
}
