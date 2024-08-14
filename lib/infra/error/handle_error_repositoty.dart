import 'package:dartz/dartz.dart';

mixin HandleOrErrorRepository {
  Future<Either<Exception, T>> handleRequestOrErrors<T>(
    Future<T> Function() call,
  ) async {
    try {
      final result = await call();
      return Right(result);
    } on Exception {
      return Left(Exception());
    }
  }
}
