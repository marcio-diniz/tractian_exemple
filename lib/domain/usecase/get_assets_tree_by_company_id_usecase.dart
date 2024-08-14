import 'package:dartz/dartz.dart';
import 'package:tractian_exemple/domain/entities/elementsTree/assets_tree_entity.dart';

import '../repositories/i_assets_tree_repository.dart';
import 'interfaces/i_get_assets_tree_by_company_id_usecase.dart';

class GetAssetsTreeByCompanyIdUsecase
    implements IGetAssetsTreeByCompanyIdUsecase {
  GetAssetsTreeByCompanyIdUsecase({required this.repository});
  final IAssetsTreeRepository repository;

  @override
  Future<Either<Exception, AssetsTreeEntity>> call({
    required String companyId,
  }) async {
    return repository.getAssetsTreeByCompanyId(companyId: companyId);
  }
}
