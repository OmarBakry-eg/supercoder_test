import 'package:flutter/material.dart';

class GlobalAppLifecycleListenerWidget extends StatefulWidget {
  final Function(AppLifecycleState)? onAppLifecycleChanged;
  final Widget child;
  const GlobalAppLifecycleListenerWidget(
      {super.key, this.onAppLifecycleChanged, required this.child});

  @override
  GlobalAppLifecycleListenerWidgetState createState() => GlobalAppLifecycleListenerWidgetState();
}

class GlobalAppLifecycleListenerWidgetState extends State<GlobalAppLifecycleListenerWidget>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) =>
      widget.onAppLifecycleChanged?.call(state);

  @override
  Widget build(BuildContext context) => widget.child;
}
