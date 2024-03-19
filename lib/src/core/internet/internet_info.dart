import 'package:supercoder_test/src/utils/exports.dart';

abstract class InternetInfo {
  Future<bool> get isConnected;
}

class InternetInfoImpl implements InternetInfo {
  final InternetConnection connectionChecker;

  InternetInfoImpl(this.connectionChecker);
  @override
  Future<bool> get isConnected => connectionChecker.hasInternetAccess;
}
