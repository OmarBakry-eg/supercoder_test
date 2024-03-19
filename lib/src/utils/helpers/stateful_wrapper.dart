import 'package:flutter/material.dart';

class StatefulWrapper extends StatefulWidget {
  final Widget child;
  final Function? onInit, onChangeDependencies, onDispose;
  const StatefulWrapper(
      {super.key, this.onInit, this.onChangeDependencies,this.onDispose, required this.child});

  @override
  StatefulWrapperState createState() => StatefulWrapperState();
}

class StatefulWrapperState extends State<StatefulWrapper> {
  @override
  void initState() {
    if (widget.onInit != null) {
      widget.onInit!();
    }
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (widget.onChangeDependencies != null) {
      widget.onChangeDependencies!();
    }
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    if (widget.onDispose != null) {
      widget.onDispose!();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
