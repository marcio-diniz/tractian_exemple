import 'package:dartz/dartz.dart';

import '../../domain/entities/elementsTree/assets_tree_entity.dart';
import '../../domain/repositories/i_assets_tree_repository.dart';
import '../../infra/error/handle_error_repositoty.dart';
import '../datasources/interfaces/i_assets_tree_data_source.dart';

class AssetsTreeRepositoryImpl
    with HandleOrErrorRepository
    implements IAssetsTreeRepository {
  AssetsTreeRepositoryImpl({
    required this.dataSource,
  });
  final IAssetsTreeDataSource dataSource;

  @override
  Future<Either<Exception, AssetsTreeEntity>> getAssetsTreeByCompanyId({
    required String companyId,
  }) =>
      handleRequestOrErrors<AssetsTreeEntity>(() async =>
          dataSource.getAssetsTreeByCompanyId(companyId: companyId));
}
