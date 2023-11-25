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
          Text(AppStrings.welcome, style: textTheme.titleMedium),
          AppSizes.s36.sizedBoxHeight,
          TextFormField(
            autocorrect: false,
            cursorHeight: AppSizes.s24,
            style: textTheme.labelMedium,
            controller: emailInputController,
            keyboardType: TextInputType.emailAddress,
            validator: (value) => InputValidator.emailValidation(value),
            onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
            decoration: inputDecoration(
              rightIcon: const Icon(Icons.email, size: AppSizes.s20),
              colorTheme: colorScheme,
              labelText: AppStrings.email,
              helperText: AppStrings.empty,
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
            style: textTheme.labelMedium!.copyWith(decorationThickness: 0),
            onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
            decoration: inputDecoration(
              rightIcon: IconButton(
                onPressed: togglePassword,
                icon: Icon(isPasswordVisible ? Icons.visibility_off : Icons.visibility, size: AppSizes.s20),
              ),
              colorTheme: colorScheme,
              helperText: AppStrings.empty,
              labelText: AppStrings.password,
            ),
          ),
          AppSizes.s24.sizedBoxHeight,
          ElevatedButton(
            onPressed: onLoginPress,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.purpleMain,
              padding: const EdgeInsets.symmetric(vertical: AppPaddings.p8, horizontal: AppPaddings.p20),
            ),
            // child: Text(AppStrings.login, style: textTheme.labelMedium),
            child: isLoading
                ? Container(
                    height: AppSizes.s44,
                    width: AppSizes.s100,
                    padding: const EdgeInsets.symmetric(horizontal: AppPaddings.p40, vertical: AppPaddings.p12),
                    child: Center(
                      child: Platform.isIOS
                          ? const CupertinoActivityIndicator(radius: AppSizes.s12, color: AppColors.white)
                          : const CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                    ),
                  )
                : SizedBox(
                    height: AppSizes.s44,
                    width: AppSizes.s100,
                    child: Center(
                      child: Text(AppStrings.register, style: textTheme.labelMedium),
                    ),
                  ),
          )
        ],
      ),
    );
  }
}
