import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart' show CupertinoActivityIndicator;

import 'package:beats_box/services/services_barrel.dart' show DoubleExtension;
import 'package:beats_box/utilities/utilities_barrel.dart' show inputDecoration, InputValidator;
import 'package:beats_box/constants/constants_barrel.dart' show AppSizes, AppStrings, AppColors, AppPaddings;

class LoginForm extends StatelessWidget {
  final bool isLoading;
  final bool isPasswordVisible;
  final VoidCallback onLoginPress;
  final VoidCallback togglePassword;
  final AutovalidateMode autoValidate;
  final GlobalKey<FormState> loginFormKey;
  final TextEditingController emailInputController;
  final TextEditingController passwordInputController;

  const LoginForm({
    super.key,
    required this.isLoading,
    required this.loginFormKey,
    required this.onLoginPress,
    required this.autoValidate,
    required this.togglePassword,
    required this.isPasswordVisible,
    required this.emailInputController,
    required this.passwordInputController,
  });

  Widget showButtonOrSpinner(TextTheme textTheme) {
    return isLoading
        ? Container(
            width: AppSizes.s80,
            height: AppSizes.s34,
            padding: const EdgeInsets.symmetric(horizontal: AppPaddings.p29, vertical: AppPaddings.p6),
            child: Center(
              child: Platform.isIOS
                  ? const CupertinoActivityIndicator(radius: AppSizes.s12, color: AppColors.white)
                  : const CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
            ),
          )
        : SizedBox(
            width: AppSizes.s80,
            height: AppSizes.s34,
            child: Center(
              child: Text(
                AppStrings.login,
                style: textTheme.labelMedium!.copyWith(color: AppColors.slightlyWhite),
              ),
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Form(
      key: loginFormKey,
      autovalidateMode: autoValidate,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppSizes.s50.sizedBoxHeight,
          Text(AppStrings.welcome, style: textTheme.titleMedium!.copyWith(color: AppColors.slightlyWhite)),
          AppSizes.s36.sizedBoxHeight,
          TextFormField(
            autocorrect: false,
            cursorHeight: AppSizes.s24,
            controller: emailInputController,
            keyboardType: TextInputType.emailAddress,
            validator: (value) => InputValidator.emailValidation(value),
            onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
            style: textTheme.labelMedium!.copyWith(color: AppColors.slightlyWhite),
            decoration: inputDecoration(
              colorTheme: colorScheme,
              labelText: AppStrings.email,
              helperText: AppStrings.empty,
              inputLabelColor: AppColors.slightlyWhite,
              rightIcon: const Icon(
                Icons.email,
                size: AppSizes.s20,
                color: AppColors.lessLightTeal,
              ),
            ),
          ),
          AppSizes.s16.sizedBoxHeight,
          TextFormField(
            autocorrect: false,
            cursorHeight: AppSizes.s24,
            obscureText: !isPasswordVisible,
            keyboardType: TextInputType.text,
            enableInteractiveSelection: false,
            controller: passwordInputController,
            validator: (value) => InputValidator.passwordValidation(value),
            onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
            style: textTheme.labelMedium!.copyWith(decorationThickness: 0, color: AppColors.slightlyWhite),
            decoration: inputDecoration(
              colorTheme: colorScheme,
              helperText: AppStrings.empty,
              labelText: AppStrings.password,
              inputLabelColor: AppColors.slightlyWhite,
              rightIcon: IconButton(
                onPressed: togglePassword,
                color: AppColors.lessLightTeal,
                icon: Icon(isPasswordVisible ? Icons.visibility_off : Icons.visibility, size: AppSizes.s20),
              ),
            ),
          ),
          AppSizes.s24.sizedBoxHeight,
          ElevatedButton(
            onPressed: onLoginPress,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.purpleMain,
              padding: const EdgeInsets.symmetric(vertical: AppPaddings.p8, horizontal: AppPaddings.p20),
            ),
            child: showButtonOrSpinner(textTheme),
          ),
        ],
      ),
    );
  }
}
