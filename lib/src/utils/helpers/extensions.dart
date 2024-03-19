import 'package:flutter/material.dart';
import 'package:supercoder_test/src/utils/exports.dart';

extension Edits on Widget {
  Column addDivider(
      {double? height = 10,
      double? indent = 10,
      double? endIndent = 10,
      double? thickness = 1,
      Color? color = Colors.black}) {
    return Column(
      children: [
        this,
        Divider(
          height: height,
          indent: indent,
          endIndent: endIndent,
          thickness: thickness,
          color: color,
        )
      ],
    );
  }

  GestureDetector removeFocus(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: this,
    );
  }

  StatelessWidget makeWidgetGestureClickable(BuildContext context,
      {void Function()? onTap,
      void Function(TapDownDetails)? onTapDown,
      bool useInkWell = false}) {
    return useInkWell
        ? InkWell(
            onTap: onTap,
            onTapDown: onTapDown,
            child: this,
          )
        : GestureDetector(
            onTap: onTap,
            onTapDown: onTapDown,
            child: this,
          );
  }

  Align addingAlign(BuildContext context,
      {required AlignmentGeometry alignmentGeometry}) {
    return Align(
      alignment: alignmentGeometry,
      child: this,
    );
  }

  Padding addPadding(BuildContext context,
      {required EdgeInsetsGeometry edgeInsetsGeometry}) {
    return Padding(
      padding: edgeInsetsGeometry,
      child: this,
    );
  }

  Widget addRefreshIndicatorAboveYourWidget(
      {required Future<void> Function() onRefresh}) {
    return Stack(
      children: [
        RefreshIndicator.adaptive(onRefresh: onRefresh, child: ListView()),
        this
      ],
    );
  }

  PositionedDirectional addPositionedDirectional(
    BuildContext context, {
    double? start,
    double? top,
    double? end,
    double? bottom,
    double? width,
    double? height,
  }) {
    return PositionedDirectional(
      start: start,
      top: top,
      end: end,
      bottom: bottom,
      width: width,
      height: height,
      child: this,
    );
  }

  SizedBox addSizedBox(
    BuildContext context, {
    double? width,
    double? height,
  }) {
    return SizedBox(
      width: width,
      height: height,
      child: this,
    );
  }
}

extension Edis on String {
  String get convertEnglishumberToArabicNumber {
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const farsi = [
      '٠',
      '١',
      '٢',
      '٣',
      '٤',
      '٥',
      '٦',
      '٧',
      '٨',
      '٩',
    ];
    String res = this;
    for (int i = 0; i < english.length; i++) {
      res = res.replaceAll(english[i], farsi[i]);
    }

    return res.trim();
  }

  String get convertArabicNumberToEnglishNumber {
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const farsi = [
      '٠',
      '١',
      '٢',
      '٣',
      '٤',
      '٥',
      '٦',
      '٧',
      '٨',
      '٩',
    ];
    String res = this;
    for (int i = 0; i < farsi.length; i++) {
      res = res.replaceAll(farsi[i], english[i]);
    }

    return res;
  }

  bool get numberIsArabic => RegExp(r'(^[٠-٩])').hasMatch(this);

  get addMatches {
    return true;
  }

  String? get capitalize {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  bool get isEmail => RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(this);

  bool get isPhoneNumber =>
      RegExp(r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$')
          .hasMatch(numberIsArabic ? convertArabicNumberToEnglishNumber : this);

  bool get isPhoneNumberEG {
    return RegExp(r'^[0]?1[0125][0-9]{8}$')
        .hasMatch(numberIsArabic ? convertArabicNumberToEnglishNumber : this);
  }

  String get getHourString {
    int value = int.parse(this);
    if (value < 60) {
      return "$value ${"minutes"}";
    }
    final int hour = value ~/ 60;
    //final int minutes = value % 60;
    return "$hour ${"hrs"}";
  }
}

extension Updates on BuildContext {
  Size getParentSize(GlobalKey key) {
    final box = key.currentContext?.findRenderObject() as RenderBox;
    return box.size;
  }

  double get mediaWidth => MediaQuery.sizeOf(this).width;
  double get mediaHeight => MediaQuery.sizeOf(this).height;
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  SizedBox get viewMediaPaddingTopWidget => SizedBox(
        height: mediaQuery.viewPadding.top,
      );
  SizedBox get viewMediaPaddingBottomWidget => SizedBox(
        height: mediaQuery.viewPadding.bottom,
      );
  // bool get isLanguageEnglish => locale.languageCode.toUpperCase() == 'EN';
}
