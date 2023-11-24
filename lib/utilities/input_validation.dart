import 'package:beats_box/constants/constants_barrel.dart' show AppStrings;

class InputValidator {
  static String? emptyValidation(String? inputValue, String? inputName) {
    if (inputValue == null || inputValue.trim().toLowerCase().isEmpty) {
      return "${AppStrings.emptyValidation} ${inputName?.trim().toLowerCase() ?? 'input'}";
    }

    return null;
  }

  static String? emailValidation(String? inputValue) {
    if (inputValue == null || inputValue.trim().toLowerCase().isEmpty) {
      return "${AppStrings.emptyValidation} email";
    }

    if (inputValue.isNotEmpty) {
      final bool isEmailValid = RegExp(AppStrings.emailRegEx).hasMatch(inputValue);

      if (!isEmailValid) {
        return AppStrings.emailValidation;
      }
    }

    return null;
  }

  static String? fullNameValidation(String? inputValue) {
    if (inputValue == null || inputValue.trim().toLowerCase().isEmpty) {
      return "${AppStrings.emptyValidation} your full name";
    }

    if (inputValue.isNotEmpty) {
      if (inputValue.length < 5) {
        return AppStrings.shortValidation;
      }
    }

    return null;
  }

  static String? passwordValidation(String? inputValue) {
    if (inputValue == null || inputValue.trim().toLowerCase().isEmpty) {
      return "${AppStrings.emptyValidation} a strong password";
    }

    if (inputValue.isNotEmpty) {
      if (inputValue.length < 8) {
        return AppStrings.shortPassword;
      }
    }

    return null;
  }

  static String? confirmPasswordValidation(String? password, String? confirmPassword) {
    if (confirmPassword == null || confirmPassword.trim().toLowerCase().isEmpty) {
      return AppStrings.emptyConfirmPassword;
    }

    if (confirmPassword != password) {
      return AppStrings.passwordNoMatch;
    }

    return null;
  }
}
