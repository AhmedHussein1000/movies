import 'package:movies_app/core/network/error_model.dart';

class ServerException implements Exception {
  final ErrorModel errorModel;
  ServerException({required this.errorModel});
}
