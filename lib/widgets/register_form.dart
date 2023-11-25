import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart' show CupertinoActivityIndicator;

import 'package:beats_box/services/services_barrel.dart';
import 'package:beats_box/constants/constants_barrel.dart';
import 'package:beats_box/utilities/utilities_barrel.dart' show inputDecoration, InputValidator;

class RegisterForm extends StatelessWidget {
  final bool isLoading;
  final bool isPasswordVisible;
  final VoidCallback togglePassword;
  final VoidCallback onRegisterPress;
  final bool isConfirmPasswordVisible;
  final AutovalidateMode autoValidate;
  final VoidCallback toggleConfirmPassword;
  final GlobalKey<FormState> registerFormKey;
  final TextEditingController emailInputController;
  final TextEditingController fullNameInputController;
  final TextEditingController passwordInputController;
  final TextEditingController confirmPasswordInputController;

  const RegisterForm({
    super.key,
    required this.isLoading,
    required this.autoValidate,
    required this.togglePassword,
    required this.onRegisterPress,
    required this.registerFormKey,
    required this.isPasswordVisible,
    required this.emailInputController,
    required this.toggleConfirmPassword,
    required this.passwordInputController,
    required this.fullNameInputController,
    required this.isConfirmPasswordVisible,
    required this.confirmPasswordInputController,
  });

  @override
  Widget build(BuildContext context) {
    String? passwordValue;

    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Form(
      key: registerFormKey,
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
            maxLength: 50,
            autocorrect: false,
            cursorHeight: AppSizes.s24,
            style: textTheme.labelMedium,
            keyboardType: TextInputType.text,
            controller: fullNameInputController,
            textCapitalization: TextCapitalization.words,
            validator: (value) => InputValidator.fullNameValidation(value),
            onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
            decoration: inputDecoration(
              colorTheme: colorScheme,
              helperText: AppStrings.empty,
              labelText: AppStrings.fullName,
              rightIcon: const Icon(Icons.person, size: AppSizes.s20),
            ),
          ),
          AppSizes.s16.sizedBoxHeight,
          TextFormField(
            autocorrect: false,
            cursorHeight: AppSizes.s24,
            style: textTheme.labelMedium,
            controller: emailInputController,
            keyboardType: TextInputType.emailAddress,
            validator: (value) => InputValidator.emailValidation(value),
            onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
            decoration: inputDecoration(
              colorTheme: colorScheme,
              labelText: AppStrings.email,
              helperText: AppStrings.empty,
              rightIcon: const Icon(Icons.email, size: AppSizes.s20),
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
            validator: (value) {
              passwordValue = value;
              return InputValidator.passwordValidation(value);
            },
            style: textTheme.labelMedium!.copyWith(decorationThickness: 0),
            onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
            decoration: inputDecoration(
              colorTheme: colorScheme,
              helperText: AppStrings.empty,
              labelText: AppStrings.password,
              rightIcon: IconButton(
                onPressed: togglePassword,
                icon: Icon(isPasswordVisible ? Icons.visibility_off : Icons.visibility, size: AppSizes.s20),
              ),
            ),
          ),
          AppSizes.s16.sizedBoxHeight,
          TextFormField(
            autocorrect: false,
            cursorHeight: AppSizes.s24,
            obscureText: !isConfirmPasswordVisible,
            keyboardType: TextInputType.text,
            enableInteractiveSelection: false,
            controller: confirmPasswordInputController,
            style: textTheme.labelMedium!.copyWith(decorationThickness: 0),
            onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
            validator: (value) => InputValidator.confirmPasswordValidation(passwordValue, value),
            decoration: inputDecoration(
              colorTheme: colorScheme,
              helperText: AppStrings.empty,
              labelText: AppStrings.confirmPassword,
              rightIcon: IconButton(
                onPressed: toggleConfirmPassword,
                icon: Icon(isConfirmPasswordVisible ? Icons.visibility_off : Icons.visibility, size: AppSizes.s20),
              ),
            ),
          ),
          AppSizes.s24.sizedBoxHeight,
          ElevatedButton(
            onPressed: onRegisterPress,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(AppColors.purpleMain),
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                const EdgeInsets.symmetric(vertical: AppPaddings.p2, horizontal: AppPaddings.p10),
              ),
            ),
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
