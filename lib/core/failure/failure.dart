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
  String get message => "Error getting entries from device";
}

class CachePutFailure extends Failure {
  @override
  String get message => "Error saving entry to device";
}

class CacheDeleteFailure extends Failure {
  @override
  String get message => "Error deleting entry from device";
}
