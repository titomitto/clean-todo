import 'package:dartz/dartz.dart';

import '../errors/failure.dart';

abstract class UseCase<R, P> {
  Future<Either<Failure, R>> call(P params);
}

abstract class NoParamsUseCase<R> {
  Future<Either<Failure, R>> call();
}
