import 'package:dio/dio.dart';

class CacheException implements Exception {}

class ServerException implements Exception {
  ServerException(DioError dioError);
}

class InvalidInputException implements Exception {}
