import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ShimmerWidget extends StatelessWidget {
  final Widget child;
  final bool enabled;
  final PaintingEffect? effect;
  final TextBoneBorderRadius? textBoneBorderRadius;
  final bool? ignoreContainers;
  final bool? justifyMultiLineText;
  final Color? containersColor;
  final bool ignorePointers, useLeaf;
  const ShimmerWidget({
    super.key,
    required this.child,
    this.enabled = true,
    this.effect,
    this.textBoneBorderRadius,
    this.ignoreContainers,
    this.justifyMultiLineText,
    this.containersColor,
    this.ignorePointers = true,
    this.useLeaf = false,
  });

  @override
  Widget build(BuildContext context) {
    return useLeaf
        ? Skeleton.leaf(enabled: enabled, child: child)
        : Skeletonizer(
            effect: effect,
            textBoneBorderRadius: textBoneBorderRadius,
            ignoreContainers: ignoreContainers,
            justifyMultiLineText: justifyMultiLineText,
            containersColor: containersColor,
            ignorePointers: ignorePointers,
            enabled: enabled,
            child: child,
          );
  }
}
