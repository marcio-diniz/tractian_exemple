import 'package:dartz/dartz.dart';
import 'package:tractian_exemple/domain/entities/elementsTree/assets_tree_entity.dart';

abstract class IGetAssetsTreeByCompanyIdUsecase {
  Future<Either<Exception, AssetsTreeEntity>> call({
    required String companyId,
  });
}
