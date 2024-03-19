import 'package:flutter/material.dart';
import 'package:supercoder_test/src/utils/UI/size_utils.dart';
import 'package:supercoder_test/src/utils/theme/theme_helper.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyLargeNotoSansffbabbc0 =>
      theme.textTheme.bodyLarge!.notoSans.copyWith(
        color: const Color(0XFFBABBC0),
      );
  static get bodyLargeffffffff => theme.textTheme.bodyLarge!.copyWith(
        color: const Color(0XFFFFFFFF),
      );
  static get bodyMedium14 => theme.textTheme.bodyMedium!.copyWith(
        fontSize: 14.fSize,
      );
  static get bodyMediumBluegray100 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.blueGray100,
      );
  static get bodyMediumErrorContainer => theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.errorContainer,
      );
  static TextStyle get bodyMediumGray600 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.gray600,
      );
  static get bodyMediumNotoSans66ffffff =>
      theme.textTheme.bodyMedium!.notoSans.copyWith(
        color: const Color(0X66FFFFFF),
        fontSize: 14.fSize,
      );
  static get bodyMediumNotoSansGray400 =>
      theme.textTheme.bodyMedium!.notoSans.copyWith(
        color: appTheme.gray400,
        fontSize: 14.fSize,
      );
  static get bodyMediumNotoSansffbabbc0 =>
      theme.textTheme.bodyMedium!.notoSans.copyWith(
        color: const Color(0XFFBABBC0),
        fontSize: 14.fSize,
      );
  static get bodyMediumffffffff => theme.textTheme.bodyMedium!.copyWith(
        color: const Color(0XFFFFFFFF),
      );
  // Label text style
  static get labelLargeGray600 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.gray600,
      );
  static get labelLargePrimary => theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w700,
      );
  static get labelLargePrimary_1 => theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.primary,
      );
  static get labelLargeWhiteA700 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.whiteA700.withOpacity(0.8),
      );
  // Title text style
  static get titleMediumGray600 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray600,
      );
  static get titleMediumNotoSansffffffff =>
      theme.textTheme.titleMedium!.notoSans.copyWith(
        color: const Color(0XFFFFFFFF),
      );
  static get titleMediumPrimary => theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.primary,
      );
  static get titleMediumSecondaryContainer =>
      theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.secondaryContainer,
      );
  static get titleMediumWhiteA700 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumWhiteA700_1 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.whiteA700,
      );
  static get titleSmallGray500 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.gray500,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallMedium => theme.textTheme.titleSmall!.copyWith(
        fontWeight: FontWeight.w500,
      );
  static get titleSmallWhiteA700 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.whiteA700,
        fontWeight: FontWeight.w500,
      );
  static get titleSmallffa2a09c => theme.textTheme.titleSmall!.copyWith(
        color: const Color(0XFFA2A09C),
        fontWeight: FontWeight.w500,
      );
}

extension on TextStyle {
  TextStyle get notoSans {
    return copyWith(
      fontFamily: 'Noto Sans',
    );
  }

  // TextStyle get pretendardVariable {
  //   return copyWith(
  //     fontFamily: 'Pretendard Variable',
  //   );
  // }
}
