import 'package:supercoder_test/src/core/dio/error_model.dart';

class ServerException implements Exception {
  final String message;
  final num statusCode;
  final ErrorModel? errorModel;
  ServerException(
      {this.message = 'Server Exception',
      this.statusCode = 200,
      this.errorModel});
}

class EmptyCacheException implements Exception {
  final String message;
  final num statusCode;
  final ErrorModel? errorModel;
  const EmptyCacheException(
      {this.message = 'Empty Cache Exception',
      this.statusCode = 200,
      this.errorModel});
}

class OfflineException implements Exception {
  final String message;
  final num statusCode;
  final ErrorModel? errorModel;
  const OfflineException(
      {this.message = 'Offline Exception',
      this.statusCode = 200,
      this.errorModel});
}
