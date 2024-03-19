import 'package:flutter/material.dart';
import 'package:supercoder_test/src/utils/exports.dart';

class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillGray => BoxDecoration(
        color: appTheme.gray900,
      );
  static BoxDecoration get fillGray60001 => BoxDecoration(
        color: appTheme.gray60001,
      );
  static BoxDecoration get fillGrayF => BoxDecoration(
        color: appTheme.gray7007f,
      );
  static BoxDecoration get fillOnError => BoxDecoration(
        color: theme.colorScheme.onError.withOpacity(1),
      );
  static BoxDecoration get fillOnError1 => BoxDecoration(
        color: theme.colorScheme.onError.withOpacity(0.8),
      );
  static BoxDecoration get fillOnPrimary => BoxDecoration(
        color: theme.colorScheme.onPrimary,
      );
  static BoxDecoration get fillOnPrimaryContainer => BoxDecoration(
        color: theme.colorScheme.onPrimaryContainer,
      );
  static BoxDecoration get fillPrimary => BoxDecoration(
        color: theme.colorScheme.primary.withOpacity(0.1),
      );
  static BoxDecoration get fillPrimaryContainer => BoxDecoration(
        color: theme.colorScheme.primaryContainer,
      );
  static BoxDecoration get fillPrimaryContainer1 => BoxDecoration(
        color: theme.colorScheme.primaryContainer.withOpacity(0.33),
      );
  static BoxDecoration get fillWhiteA => BoxDecoration(
        color: appTheme.whiteA700.withOpacity(0.2),
      );

  // Gradient decorations
  static BoxDecoration get gradientOnErrorToOnError => BoxDecoration(
        gradient: LinearGradient(
          begin: const Alignment(0.5, 0),
          end: const Alignment(0.5, 1),
          colors: [
            theme.colorScheme.onError,
            theme.colorScheme.onError.withOpacity(0.35),
          ],
        ),
      );

  // Gray decorations
  static BoxDecoration get gray900 => BoxDecoration(
        color: appTheme.gray90001,
      );

  // Outline decorations
  static BoxDecoration get outlineGray => BoxDecoration(
        color: appTheme.gray90001,
        border: Border.all(
          color: appTheme.gray800,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineGray90002 => BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: appTheme.gray90002,
            width: 1.h,
          ),
        ),
      );
  static BoxDecoration get outlineOnError => const BoxDecoration();
  static BoxDecoration get outlinePrimary => BoxDecoration(
        color: appTheme.gray90001,
        border: Border.all(
          color: theme.colorScheme.primary,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlinePrimary1 => BoxDecoration(
        color: appTheme.gray90001,
        border: Border.all(
          color: theme.colorScheme.primary,
          width: 2.h,
        ),
      );
  static BoxDecoration get outlineWhiteA => BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: appTheme.whiteA700.withOpacity(0.2),
            width: 1.h,
          ),
        ),
      );
}

class BorderRadiusStyle {
  // Circle borders
  static BorderRadius get circleBorder30 => BorderRadius.circular(
        30.h,
      );
  static BorderRadius get circleBorder36 => BorderRadius.circular(
        36.h,
      );

  // Rounded borders
  static BorderRadius get roundedBorder1 => BorderRadius.circular(
        1.h,
      );
  static BorderRadius get roundedBorder16 => BorderRadius.circular(
        16.h,
      );
  static BorderRadius get roundedBorder4 => BorderRadius.circular(
        4.h,
      );
  static BorderRadius get roundedBorder8 => BorderRadius.circular(
        8.h,
      );
}

// Comment/Uncomment the below code based on your Flutter SDK version.

// For Flutter SDK Version 3.7.2 or greater.

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;
