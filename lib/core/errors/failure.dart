abstract class Failure {}

class ServerFailure extends Failure {}

class NetworkFailure extends Failure {}

class CacheGetFailure extends Failure {}

class NotFoundFailure extends Failure {}

class CachePutFailure extends Failure {}

class CacheDeleteFailure extends Failure {}

class InvalidInputFailure extends Failure {}

class ValidationFailure implements Failure {
  final Map<String, ValidationError> errors;
  ValidationFailure(this.errors);
}

abstract class ValidationError {}
