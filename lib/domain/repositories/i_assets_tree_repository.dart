import 'package:dartz/dartz.dart';
import 'package:tractian_exemple/domain/entities/elementsTree/assets_tree_entity.dart';

abstract class IAssetsTreeRepository {
  Future<Either<Exception, AssetsTreeEntity>> getAssetsTreeByCompanyId({
    required String companyId,
  });
}
