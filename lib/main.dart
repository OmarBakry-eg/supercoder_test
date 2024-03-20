import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:supercoder_test/src/utils/exports.dart';
import 'src/app.dart';
import 'src/di.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  ThemeHelper().changeTheme('primary');
  ErrorWidget.builder = (FlutterErrorDetails errorDetails) => CustomErrorWidget(
        errorDetails: errorDetails,
      );
  runApp(const MyApp());
}
