import 'package:supercoder_test/src/core/dio/error_model.dart';

class Result<T> {
  Result._();

  factory Result.loading(T msg) = LoadingState<T>;

  factory Result.success(T value) = SuccessState<T>;

  factory Result.error(T msg, {ErrorModel? errorModel}) = ErrorState<T>;

  factory Result.networkError(T msg) = NetworkErrorState<T>;

  factory Result.errorWith401(T msg) = ErrorStateWith401ResponseCode<T>;
}

class LoadingState<T> extends Result<T> {
  LoadingState(this.msg) : super._();
  final T msg;
}

class ErrorState<T> extends Result<T> {
  ErrorState(this.msg, {this.errorModel}) : super._();
  final T msg;
  final ErrorModel? errorModel;
}

class ErrorStateWith401ResponseCode<T> extends Result<T> {
  ErrorStateWith401ResponseCode(this.msg) : super._();
  final T msg;
}

class SuccessState<T> extends Result<T> {
  SuccessState(this.value) : super._();
  final T value;
}

class NetworkErrorState<T> extends Result<T> {
  NetworkErrorState(this.msg) : super._();
  final T msg;
}
