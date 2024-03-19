import 'package:flutter/material.dart';
import '../exports.dart';

/// A class that offers pre-defined button styles for customizing button appearance.
class CustomButtonStyles {
  // Filled button style
  static ButtonStyle get fillGray => ElevatedButton.styleFrom(
        backgroundColor: appTheme.gray50019,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.h),
        ),
      );
  static ButtonStyle get fillGrayTL14 => ElevatedButton.styleFrom(
        backgroundColor: appTheme.gray80001,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.h),
        ),
      );
  static ButtonStyle get fillGrayTL16 => ElevatedButton.styleFrom(
        backgroundColor: appTheme.gray800,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.h),
        ),
      );
  static ButtonStyle get fillPrimaryTL22 => ElevatedButton.styleFrom(
        backgroundColor: theme.colorScheme.primary.withOpacity(0.46),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22.h),
        ),
      );

  // Outline button style
  static ButtonStyle get outlineOnError => ElevatedButton.styleFrom(
        backgroundColor: theme.colorScheme.onPrimary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.h),
        ),
        shadowColor: theme.colorScheme.onError.withOpacity(0.05),
        elevation: 2,
      );
  static ButtonStyle get outlineOnErrorTL26 => ElevatedButton.styleFrom(
        backgroundColor: theme.colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(26.h),
        ),
        shadowColor: theme.colorScheme.onError.withOpacity(0.05),
        elevation: 2,
      );
  static ButtonStyle get outlinePrimary => OutlinedButton.styleFrom(
        backgroundColor: appTheme.gray700,
        side: BorderSide(
          color: theme.colorScheme.primary,
          width: 1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.h),
        ),
      );
  // text button style
  static ButtonStyle get none => ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
        elevation: MaterialStateProperty.all<double>(0),
      );
}
