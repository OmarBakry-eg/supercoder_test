import 'package:flutter/material.dart';
import 'package:supercoder_test/src/utils/exports.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.height,
    this.styleType,
    this.leadingWidth,
    this.leading,
    this.title,
    this.centerTitle,
    this.actions,
  });

  final double? height;

  final Style? styleType;

  final double? leadingWidth;

  final Widget? leading;

  final Widget? title;

  final bool? centerTitle;

  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: height ?? 24.v,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      flexibleSpace: _getStyle(),
      leadingWidth: leadingWidth ?? 0,
      leading: leading,
      title: title,
      titleSpacing: 0,
      centerTitle: centerTitle ?? false,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size(
        SizeUtils.width,
        height ?? 24.v,
      );
  _getStyle() {
    switch (styleType) {
      case Style.bgGradientnameonErroropacity052nameonError:
        return Container(
          height: 158.v,
          width: double.maxFinite,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: const Alignment(0.5, 0),
              end: const Alignment(0.5, 1),
              colors: [
                theme.colorScheme.onError.withOpacity(0.52),
                theme.colorScheme.onError,
              ],
            ),
          ),
        );
      default:
        return null;
    }
  }
}

enum Style {
  bgGradientnameonErroropacity052nameonError,
}
