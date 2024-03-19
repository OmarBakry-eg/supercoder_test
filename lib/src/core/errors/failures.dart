// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:supercoder_test/src/core/dio/error_model.dart';

sealed class Failure extends Equatable {
  final String message;
  final ErrorModel? errorModel;
  const Failure({
    required this.message,
    this.errorModel,
  });
}

final class OfflineFailure extends Failure {
  const OfflineFailure({required super.message, super.errorModel});

  @override
  List<Object?> get props => [];
}

final class ServerFailure extends Failure {
  const ServerFailure({required super.message, super.errorModel});

  @override
  List<Object?> get props => [];
}

final class EmptyCacheFailure extends Failure {
  const EmptyCacheFailure({required super.message, super.errorModel});

  @override
  List<Object?> get props => [];
}
