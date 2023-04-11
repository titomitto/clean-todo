import 'exceptions.dart';

abstract class Failure {}

class ServerFailure extends Failure {
  final ServerException _exception;
  ServerFailure(this._exception);
  @override
  String get message {
    return _exception.message;
  }
}

class NetworkFailure extends Failure {}

class CacheGetFailure extends Failure {}

class CachePutFailure extends Failure {}

class CacheDeleteFailure extends Failure {}

class InvalidInputFailure extends Failure {}

class ValidationFailure implements Failure {
  final Map<String, ValidationError> errors;

  ValidationFailure(this.errors);

  ValidationError? errorForField(String field) {
    return errors[field];
  }
}

abstract class ValidationError {}
