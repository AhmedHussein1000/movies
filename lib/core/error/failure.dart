import 'package:dio/dio.dart';

abstract class Failure {
  final String message;
  const Failure(this.message);
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);

  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return const ServerFailure('Connection timeout with server');

      case DioExceptionType.sendTimeout:
        return const ServerFailure('Send timeout in connection with server');

      case DioExceptionType.receiveTimeout:
        return const ServerFailure('Receive timeout in connection with server');

      case DioExceptionType.badCertificate:
        return const ServerFailure('Bad certificate detected');

      case DioExceptionType.badResponse:
        return _handleResponseError(dioError.response);

      case DioExceptionType.cancel:
        return const ServerFailure('Request to server was cancelled');

      case DioExceptionType.connectionError:
        return const ServerFailure('Connection to server failed');

      case DioExceptionType.unknown:
        if (dioError.message?.contains('SocketException') ?? false) {
          return const ServerFailure('No Internet connection');
        }
        return const ServerFailure('Unexpected error occurred');
    }
  }

  static ServerFailure _handleResponseError(Response? response) {
    final statusCode = response?.statusCode ?? 500;
    final errorMessage = response?.statusMessage ?? 'Unknown error';

    switch (statusCode) {
      case 400:
        return const ServerFailure('Bad request');
      case 401:
        return const ServerFailure('Unauthorized access');
      case 403:
        return const ServerFailure('Forbidden request');
      case 404:
        return const ServerFailure('Resource not found');
      case 409:
        return const ServerFailure('Conflict occurred');
      case 500:
        return const ServerFailure('Internal server error');
      case 502:
        return const ServerFailure('Bad gateway');
      default:
        return ServerFailure(
            'Received invalid status code: $statusCode - $errorMessage');
    }
  }
}
