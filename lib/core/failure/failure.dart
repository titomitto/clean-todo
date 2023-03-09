import 'exceptions.dart';

abstract class Failure {
  String get msg;
}

class ServerFailure extends Failure {
  final ServerException _exception;
  ServerFailure(this._exception);
  @override
  String get msg {
    return _exception.message;
  }
}

class CacheGetFailure extends Failure {
  @override
  String get msg => "Error getting entries from device";
}

class CachePutFailure extends Failure {
  @override
  String get msg => "Error saving entry to device";
}

class CacheDeleteFailure extends Failure {
  @override
  String get msg => "Error deleting entry from device";
}
