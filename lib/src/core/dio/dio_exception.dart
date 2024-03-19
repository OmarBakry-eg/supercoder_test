import 'package:dio/dio.dart';

class DioExceptions implements Exception {
  String message = '';
  DioExceptions.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.cancel:
        message = "Request to API server was cancelled";
        break;
      case DioExceptionType.connectionTimeout:
        message = "Connection timeout with API server";
        break;
      case DioExceptionType.receiveTimeout:
        message = "Receive timeout in connection with API server";
        break;
      case DioExceptionType.badResponse:
        message =
            "${"Something went wrong"}, ${dioError.response?.statusCode}, ${dioError.error}";

        break;
      case DioExceptionType.sendTimeout:
        message = "Send timeout in connection with API server";
        break;
      case DioExceptionType.badCertificate:
        message = "Bad Certificate in connection with API server";
        break;
      case DioExceptionType.connectionError:
        message = "Error in connection with API server";
        break;
      case DioExceptionType.unknown:
        message = '${dioError.error}';
      // dioError.response == null
      //     ? '${dioError.error}'
      //     : _handleError(ErrorModel.fromJson(dioError.response?.data));
      default:
        message = "Something went wrong";
        break;
    }
  }

  @override
  String toString() => message;
}
