import 'dart:developer' as developer;

import 'dart:io';

import 'package:flutter/material.dart';

// Blue text
void logInfo(String msg) {
  Platform.isAndroid
      ? debugPrint('\x1B[34m$msg\x1B[0m')
      : developer.log('\x1B[34m$msg\x1B[0m');
}

// Green text
void logSuccess(String msg) {
  Platform.isAndroid
      ? debugPrint('\x1B[32m$msg\x1B[0m')
      : developer.log('\x1B[32m$msg\x1B[0m');
}

// Yellow text
void logWarning(String msg) {
  Platform.isAndroid
      ? debugPrint('\x1B[33m$msg\x1B[0m')
      : developer.log('\x1B[33m$msg\x1B[0m');
}

// Red text
void logError(String msg) {
  Platform.isAndroid
      ? debugPrint('\x1B[31m$msg\x1B[0m')
      : developer.log('\x1B[31m$msg\x1B[0m');
}

void logNormal(String msg) {
  Platform.isAndroid ? debugPrint(msg) : developer.log(msg);
}
// Black:   \x1B[30m
// Red:     \x1B[31m
// Green:   \x1B[32m
// Yellow:  \x1B[33m
// Blue:    \x1B[34m
// Magenta: \x1B[35m
// Cyan:    \x1B[36m
// White:   \x1B[37m
// Reset:   \x1B[0m