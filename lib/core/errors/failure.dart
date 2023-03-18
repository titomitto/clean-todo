import 'exceptions.dart';

abstract class Failure {
  String get message;
}

class ServerFailure extends Failure {
  final ServerException _exception;
  ServerFailure(this._exception);
  @override
  String get message {
    return _exception.message;
  }
}

class CacheGetFailure extends Failure {
  @override
  String get message => "Failed to retrieve data. We're working to fix it.";
}

class CachePutFailure extends Failure {
  @override
  String get message => "Failed to save data. We're working to fix it.";
}

class CacheDeleteFailure extends Failure {
  @override
  String get message => "Failed to delete data. We're working to fix it.";
}

class InvalidInputFailure extends Failure {
  @override
  String get message => "Failed to validate input. We're working to fix it.";
}
