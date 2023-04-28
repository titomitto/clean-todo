import 'dart:async';

import 'package:dartz/dartz.dart';
import '../errors/exceptions.dart';
import '../errors/failures.dart';

class ErrorHandler<T> {
  Future<T> handleErrors(
    Future<T> Function() asyncFunction,
  ) async {
    try {
      return await asyncFunction();
    } catch (error, stackTrace) {
      print('Error caught: $error');
      print('StackTrace: $stackTrace');

      if (error is CacheException ||
          error is ServerException ||
          error is UnauthorizedException ||
          error is UnexpectedResponseException ||
          error is ServerValidationException ||
          error is NotFoundException ||
          error is NoInternetException) {
        rethrow;
      } else {
        throw InvalidArgumentException();
      }
    }
  }

  Future<Either<Failure, T>> handleExceptions<T>(
      Future<T> Function() asyncFunction) async {
    try {
      return Right(await asyncFunction());
    } catch (error) {
      if (error is CacheException) {
        return Left(CacheFailure());
      } else if (error is ServerException) {
        return Left(ServerFailure());
      } else if (error is UnauthorizedException) {
        return Left(UnauthorizedFailure());
      } else if (error is UnexpectedResponseException) {
        return Left(UnexpectedResponseFailure());
      } else if (error is ServerValidationException) {
        return Left(ServerValidationFailure());
      } else if (error is NotFoundException) {
        return Left(NotFoundFailure());
      } else if (error is NoInternetException) {
        return Left(NoInternetFailure());
      } else {
        return Left(InvalidArgumentFailure());
      }
    }
  }
}
