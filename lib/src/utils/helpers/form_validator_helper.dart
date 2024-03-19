// import 'package:supercoder_test/src/core/location/location_controller.dart';
import 'package:supercoder_test/src/utils/exports.dart';

final class FormValidator {
  static String? generalEmptyValidator(String? text, {String? message}) {
    if (text == null || text.isEmpty) {
      return message ?? 'This field cannot be empty';
    }
    return null;
  }

  static String? genderValidator(String? text, {String? message}) {
    String? res =
        generalEmptyValidator(text, message: 'Please Select Your Gender');
    if (res == null) {
      if (text == 'Select Gender') {
        return 'Please Select Your Gender';
      }
    }
    return res;
  }

  static String? signUpPhoneNumberValidator(String? text) {
    String? res = generalEmptyValidator(text,
        message: 'Phone number cannot be empty');
    if (res == null) {
      if (!text!.isPhoneNumber) {
        return 'Please enter a valid phone number';
      }
      // if (!text.isPhoneNumberEG) {
      //   return 'Please enter a valid phone number';
      // }
    }
    return res;
  }

  static String? countryValidator(String? text) {
    String? res =
        generalEmptyValidator(text, message: 'Country cannot be empty');
    if (res == null) {
      const String isoCode = 'EG'; // LocationManager.address.countryCode;
      logWarning('text $text');
      logWarning('isoCode $isoCode');
      if (text?.toLowerCase() != isoCode.toLowerCase()) {
        return 'Selected country not the same as your current country';
      }
    }
    return res;
  }

  static String? passwordValidator(String? orgText) {
    final text = orgText?.trimRight();
    String? res =
        generalEmptyValidator(text, message: 'Password cannot be empty');
    if (res == null) {
      String? checkPass =
          _FormValidatorHelperFunctions.isPasswordCompliant(text!);
      if (checkPass != null) {
        return checkPass;
      }
    }
    return res;
  }

  static String? confirmPasswordValidator(String? orgText, String password) {
    final text = orgText?.trimRight();
    String? res =
        generalEmptyValidator(text, message: 'Password cannot be empty');
    if (res == null) {
      String? checkPass =
          _FormValidatorHelperFunctions.isPasswordCompliant(text!);
      if (checkPass != null) {
        return checkPass;
      }
      if (text != password.trim()) {
        return 'Passwords not matched';
      }
    }
    return res;
  }

  static String? emailOrPhoneValidator(String? orgText, bool isPhone) {
    final String? text = orgText?.trim();
    String? res = generalEmptyValidator(text);
    if (res == null) {
      if (isPhone) {
        if (text!.startsWith("+") || text.startsWith(RegExp(r"[0-9]|[٠-٩]"))) {
          if (!text.isPhoneNumber) {
            return 'Please enter a valid phone number';
          }
          // if (!text.isPhoneNumberEG) {
          //   return 'Please enter a valid egyption phone number';
          // }
        } else {
          return 'Please enter a valid phone number';
        }
      } else if (!text!.isEmail) {
        return 'Please enter a valid email address';
      }
    }
    return res;
  }

  static String? verifyCodeValidator(String? text) {
    String? res =
        generalEmptyValidator(text, message: 'Code cannot be empty');
    if (res == null) {
      if (text!.length < 6) {
        return 'Code must be at least 6 characters';
      }
    }
    return res;
  }
}

sealed class _FormValidatorHelperFunctions {
  static String? isPasswordCompliant(String password,
      [int minLength = 8, int maxLength = 32]) {
    if (password.length < minLength) {
      return 'Password must be at least 8 characters long';
    }
    if (password.length > maxLength) {
      return 'Password must not be more than 32 characters long';
    }
    if (!password.contains(RegExp(r"[a-z]"))) {
      return 'Password must have at least one small character';
    }
    if (!password.contains(RegExp(r"[A-Z]"))) {
      return 'Password must have at least one capital character';
    }
    if (!password.contains(RegExp(r"[0-9]"))) {
      return 'Password must have at least one number';
    }
    if (!password.contains(RegExp(r'[@#$%^&*(),.":{}|<>]'))) {
      return 'Password must have at least one special character, @ # ^..etc'
          ;
    }
    return null;
  }
}
