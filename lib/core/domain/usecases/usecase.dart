import 'package:clean_todo/core/failure/failure.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<R, P> {
  R call(P params);
}

class NoParams {}
