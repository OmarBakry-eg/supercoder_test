import 'package:flutter/material.dart';
import 'package:supercoder_test/src/utils/exports.dart';

class AppbarTitle extends StatelessWidget {
  const AppbarTitle({
    super.key,
    required this.text,
    this.margin,
    this.onTap,
  });

  final String text;
  final EdgeInsetsGeometry? margin;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap!.call();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: Text(
          text,
          style: CustomTextStyles.titleMediumWhiteA700.copyWith(
            color: appTheme.whiteA700,
          ),
        ),
      ),
    );
  }
}
