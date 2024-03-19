import 'package:dio/dio.dart';
import 'package:supercoder_test/src/core/dio/error_model.dart' as err;
import 'package:supercoder_test/src/utils/exports.dart';
import 'dio_exception.dart';

class DioClient {
  final InternetInfo internetInfo;
  DioClient(this.internetInfo);
  final Dio _dio = Dio(BaseOptions(
      connectTimeout: const Duration(seconds: 120), // 120 seconds
      receiveTimeout: const Duration(seconds: 120), // 120 seconds
      baseUrl: Constants.devBaseURL))
    ..interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      logInfo(options.uri.toString());
      logInfo(options.headers.toString());
      logInfo(options.data.toString());
      return handler.next(options);
    }, onResponse: (response, handler) {
      logSuccess("RESPONSE_URL ${response.realUri}");
      logSuccess("RESPONSE_CODE ${response.statusCode}");
      logSuccess("RESPONSE_DATA ${response.data}");
      logSuccess('----------------------------------------------------------');
      return handler.next(response);
    }, onError: (response, handler) {
      logError(response.requestOptions.uri.toString());
      logError(response.type.name);
      logError(response.response?.statusCode?.toString() ?? "NO STATUS");
      logError(response.response?.data?.toString() ?? "NO BODY");
      logError(response.error.toString());
      logError("Message that throws a [DioException]: ${response.message}");
      logWarning('----------------------------------------------------------');
      return handler.next(response);
    }));

  bool _tokenCondition(String? token) =>
      token != null && token.trim().isNotEmpty;

  err.ErrorModel? _generateErrorMethod(DioException error) {
    err.ErrorModel? errorModel;
    try {
      errorModel = err.ErrorModel.fromJson(error.response?.data)
        ..requestOptions = error.requestOptions
        ..stackTrace = error.stackTrace;
    } catch (e) {
      logError('In generateErrorMethod Catch $e');
      errorModel = err.ErrorModel(
          data: error.response?.data,
          stackTrace: error.stackTrace,
          statusCode: error.response?.statusCode,
          exception: error.message,
          requestOptions: error.requestOptions);
    }

    logError("errorModel ${errorModel.toJson()}");

    return errorModel;
  }

  Future<Result> get(
    String endPoint,
    String? token, {
    var body,
    String? fullURL,
    bool isLoading = true,
    bool isXML = true,
    bool removeErrResult = false,
    Map<String, dynamic>? queryParameters,
  }) async {
    String url = endPoint;

    bool interNetaAvailale = await internetInfo.isConnected;

    if (isLoading) {
      Constants.showLoading();
    }
    if (token != "" && token != null) {
      _dio.options.headers["Authorization"] = "Bearer $token";
    }
    if (interNetaAvailale) {
      try {
        Response response = await _dio.get(
          fullURL ?? url,
          data: body,
          queryParameters: queryParameters,
        );
        if (isLoading) {
          Constants.hideLoadingOrNavBack;
        }

        return Result.success(response.data);
      } on DioException catch (error) {
        if (isLoading) {
          Constants.hideLoadingOrNavBack;
        }
        String errorMessage = DioExceptions.fromDioError(error).toString();

        err.ErrorModel? errorModel = _generateErrorMethod(error);

        logError("Default err case sc : ${error.response?.statusCode}");
        logError("error $error");
        logError("error.message ${error.message}");
        return Result.error(errorMessage, errorModel: errorModel);
      }
    } else {
      if (isLoading) {
        Constants.hideLoadingOrNavBack;
      }
      return Result.networkError("No internet connection from server");
    }
  }

  Future<Result> post(
    String endPoint,
    var postMap, {
    String? fullURL,
    bool isPostData = true,
    String? token,
    bool isHeaderJsonType = true,
    bool isLoading = true,
    Map<String, dynamic>? queryParameters,
  }) async {
    String url = endPoint;
    late Response response;
    bool interNetaAvailale = await InternetConnection().hasInternetAccess;
    if (isLoading) {
      Constants.showLoading();
    }

    _dio.options.headers['Content-Type'] = isHeaderJsonType
        ? Headers.jsonContentType
        : Headers.formUrlEncodedContentType;
    if (_tokenCondition(token)) {
      _dio.options.headers["Authorization"] = "Bearer $token";
    }
    if (interNetaAvailale) {
      try {
        _dio.options.followRedirects = false;
        response = isPostData
            ? await _dio.post(fullURL ?? url,
                data: postMap, queryParameters: queryParameters)
            : await _dio.post(fullURL ?? url, queryParameters: queryParameters);
        logInfo(response.statusCode.toString());
        if (isLoading) {
          Constants.hideLoadingOrNavBack;
        }
        return Result.success(response.data);
      } on DioException catch (error) {
        if (isLoading) {
          Constants.hideLoadingOrNavBack;
        }

        String errorMessage = DioExceptions.fromDioError(error).toString();
        err.ErrorModel? errorModel = _generateErrorMethod(error);
        logError("Default err case sc : ${error.response?.statusCode}");
        logError("error $error");
        logError("error.message ${error.message}");
        return Result.error(errorMessage, errorModel: errorModel);
      }
    } else {
      if (isLoading) {
        Constants.hideLoadingOrNavBack;
      }
      return Result.networkError("No internet connection from server");
    }
  }

  Future<Result> patch(String endPoint, var postMap,
      {String? fullURL,
      bool isPostData = true,
      String? token,
      bool isHeaderJsonType = true,
      bool isLoading = true,
      Map<String, dynamic>? queryParameters}) async {
    String url = endPoint;
    late Response response;
    bool interNetaAvailale = await InternetConnection().hasInternetAccess;
    if (isLoading) {
      Constants.showLoading();
    }
    _dio.options.headers['Content-Type'] = isHeaderJsonType
        ? Headers.jsonContentType
        : Headers.formUrlEncodedContentType;
    if (_tokenCondition(token)) {
      _dio.options.headers["Authorization"] = "Bearer $token";
    }
    if (interNetaAvailale) {
      try {
        response = isPostData
            ? await _dio.patch(fullURL ?? url,
                data: postMap, queryParameters: queryParameters)
            : await _dio.patch(fullURL ?? url,
                queryParameters: queryParameters);
        logInfo(response.statusCode.toString());
        if (isLoading) {
          Constants.hideLoadingOrNavBack;
        }
        return Result.success(response.data);
      } on DioException catch (error) {
        if (isLoading) {
          Constants.hideLoadingOrNavBack;
        }
        String errorMessage = DioExceptions.fromDioError(error).toString();
        err.ErrorModel? errorModel = _generateErrorMethod(error);
        logError("Default err case sc : ${error.response?.statusCode}");
        logError("error $error");
        logError("error.message ${error.message}");
        return Result.error(errorMessage, errorModel: errorModel);
      }
    } else {
      if (isLoading) {
        Constants.hideLoadingOrNavBack;
      }
      return Result.networkError("No internet connection from server");
    }
  }

  Future<Result> put(String endPoint, var postMap,
      {String? fullURL,
      String? token,
      bool isHeaderJsonType = true,
      bool isLoading = true,
      Map<String, dynamic>? queryParameters,
      var body}) async {
    String url = endPoint;
    late Response response;
    bool interNetaAvailale = await InternetConnection().hasInternetAccess;
    if (isLoading) {
      Constants.showLoading();
    }
    _dio.options.headers['Content-Type'] = isHeaderJsonType
        ? Headers.jsonContentType
        : Headers.formUrlEncodedContentType;
    if (_tokenCondition(token)) {
      _dio.options.headers["Authorization"] = "Bearer $token";
    }
    if (interNetaAvailale) {
      try {
        response = await _dio.put(fullURL ?? url, data: postMap);
        logInfo(response.statusCode.toString());
        if (isLoading) {
          Constants.hideLoadingOrNavBack;
        }
        return Result.success(response.data);
      } on DioException catch (error) {
        if (isLoading) {
          Constants.hideLoadingOrNavBack;
        }
        String errorMessage = DioExceptions.fromDioError(error).toString();
        err.ErrorModel? errorModel = _generateErrorMethod(error);
        logError("Default err case sc : ${error.response?.statusCode}");
        logError("error $error");
        logError("error.message ${error.message}");
        return Result.error(errorMessage, errorModel: errorModel);
      }
    } else {
      if (isLoading) {
        Constants.hideLoadingOrNavBack;
      }
      return Result.networkError("No internet connection from server");
    }
  }

  Future<String?> downloadFile(String endPoint, String fileNameLocally) async {
    String url = endPoint;
    Directory saveDirectory = await getApplicationCacheDirectory();
    Directory iosDirectory =
        await Directory('${saveDirectory.parent.parent.path}/tmp')
            .create(recursive: true);
    String savePath =
        (Platform.isIOS ? "${iosDirectory.path}/" : "${saveDirectory.path}/") +
            fileNameLocally;

    logWarning("savePath $savePath");

    if (File(savePath).existsSync()) {
      return savePath;
    }

    try {
      await _dio.download(url, savePath);

      return savePath;
    } on DioException catch (error) {
      logError("Default err case sc : ${error.response?.statusCode}");
      logError("error $error");
      logError("error.message ${error.message}");
      return null;
    }
  }

  Future<Result> delete(
    String endPoint, {
    String? token,
    var body,
    String? fullURL,
    bool isLoading = true,
    Map<String, dynamic>? queryParameters,
  }) async {
    String url = endPoint;
    if (isLoading) {
      Constants.showLoading();
    }
    try {
      Response response = await _dio.delete(
        fullURL ?? url,
        data: body,
        queryParameters: queryParameters,
      );
      if (isLoading) {
        Constants.hideLoadingOrNavBack;
      }
      if (token != "" && token != null) {
        _dio.options.headers["Authorization"] = "Bearer $token";
      }
      return Result.success(response.data);
    } on DioException catch (error) {
      if (isLoading) {
        Constants.hideLoadingOrNavBack;
      }
      String errorMessage = DioExceptions.fromDioError(error).toString();

      err.ErrorModel? errorModel = _generateErrorMethod(error);

      logError("Default err case sc : ${error.response?.statusCode}");
      logError("error $error");
      logError("error.message ${error.message}");
      return Result.error(errorMessage, errorModel: errorModel);
    }
  }
}
