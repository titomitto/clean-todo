import 'package:dio/dio.dart';

class CacheException implements Exception {}

class ServerException implements Exception {
  late String message;

  ServerException.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        message = "Request was cancelled";
        break;
      case DioErrorType.connectionTimeout:
        message = "Connection timeout";
        break;
      case DioErrorType.receiveTimeout:
        message = "Receive timeout";
        break;
      case DioErrorType.badResponse:
        message = _handleError(
          dioError.response?.statusCode,
          dioError.response?.data,
        );
        break;
      case DioErrorType.sendTimeout:
        message = "Send timeout";
        break;
      case DioErrorType.unknown:
        if ((dioError.message ?? "").contains("SocketException")) {
          message = 'No Internet';
          break;
        }
        message = "Unexpected error occurred";
        break;
      default:
        message = "Something went wrong";
        break;
    }
  }

  String _handleError(int? statusCode, dynamic error) {
    switch (statusCode) {
      case 200:
        return error['message'];
      case 400:
        return 'Bad request';
      case 401:
        return 'Unauthorized';
      case 403:
        return 'Forbidden';
      case 404:
        return error['message'];
      case 500:
        return 'Internal server error';
      case 502:
        return 'Bad gateway';
      default:
        return 'Oops something went wrong';
    }
  }
}

class InvalidInputException implements Exception {}

class InvalidArgException implements Exception {}
