import 'package:dio/dio.dart';

class CacheException implements Exception {}

class ServerException implements Exception {
  final String message;

  ServerException.fromDioError(DioError dioError)
      : message = _parseDioError(dioError);

  static String _parseDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        return "The request was cancelled.";
      case DioErrorType.connectionTimeout:
        return "Unable to connect to the server. Please check your internet connection and try again.";
      case DioErrorType.receiveTimeout:
        return "The server took too long to respond. Please try again later.";
      case DioErrorType.sendTimeout:
        return "Unable to send data to the server. Please try again later.";
      case DioErrorType.badResponse:
        return _handleResponseError(dioError.response!);
      case DioErrorType.unknown:
      default:
        if ((dioError.message ?? "").contains("SocketException")) {
          return 'No internet connection. Please check your network settings and try again.';
        }
        return "An unexpected error occurred. Please try again later.";
    }
  }

  static String _handleResponseError(Response response) {
    switch (response.statusCode) {
      case 200:
        return response.data['message'] ?? 'OK';
      case 400:
        return 'There was an error processing your request. Please check your input and try again.';
      case 401:
        return 'You are not authorized to access this resource. Please log in and try again.';
      case 403:
        return 'You do not have permission to access this resource.';
      case 404:
        return 'The requested resource was not found.';
      case 500:
        return 'There was an internal server error. Please try again later.';
      case 502:
        return 'The server is currently unavailable. Please try again later.';
      default:
        return 'An unexpected error occurred. Please try again later.';
    }
  }
}

class InvalidInputException implements Exception {}
