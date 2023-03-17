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
  String get message => "Error retrieving data. We're working to fix it.";
}

class CachePutFailure extends Failure {
  @override
  String get message => "Error saving data. We're working to fix it.";
}

class CacheDeleteFailure extends Failure {
  @override
  String get message => "Error deleting data. We're working to fix it.";
}
