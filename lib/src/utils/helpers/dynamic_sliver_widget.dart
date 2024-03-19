import 'package:flutter/material.dart';

class DynamicSliverScrollWidget extends StatelessWidget {
  final Widget child;
  final bool hasScrollBody, fillOverscroll;
  const DynamicSliverScrollWidget(
      {super.key,
      required this.child,
      this.hasScrollBody = false,
      this.fillOverscroll = false});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverFillRemaining(
        hasScrollBody: hasScrollBody,
        fillOverscroll: fillOverscroll,
        child: child,
      )
    ]);
  }
}
