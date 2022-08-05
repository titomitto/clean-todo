import 'package:clean_todo/core/failure/failure.dart';
import 'package:dartz/dartz.dart';

abstract class Usecase<R, P> {
  Either<Failure, R> call(P arg);
}

abstract class NoArgsUsecase<R> {
  Either<Failure, R> call();
}

abstract class UsecaseOfStream<R, P> {
  Stream<Either<Failure, R>> call(P arg);
}

abstract class NoArgsUsecaseOfStream<R> {
  Stream<Either<Failure, R>> call();
}

abstract class UsecaseOfFuture<R, P> {
  Future<Either<Failure, R>> call(P arg);
}

abstract class NoArgsUsecaseOfFuture<R> {
  Future<Either<Failure, R>> call();
}
