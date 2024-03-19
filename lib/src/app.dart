import 'package:flutter/material.dart';
import 'package:supercoder_test/src/utils/exports.dart';
import 'di.dart' as di;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CreateCharacterCubit>.value(
          value: di.sl(),
        ),
          BlocProvider<ChatCubit>.value(
          value: di.sl(),
        ),
      ],
      child: Sizer(builder: (context, orientation, deviceType) {
        return MaterialApp(
            theme: theme,
            debugShowCheckedModeBanner: false,
            navigatorObservers: [Constants.routeObserver],
            navigatorKey: Constants.navigatorKey,
            home: const ChatScreen());
      }),
    );
  }
}
