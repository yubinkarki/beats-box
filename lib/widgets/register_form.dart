import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart' show CupertinoActivityIndicator;

import 'package:beats_box/services/services_barrel.dart' show DoubleExtension;
import 'package:beats_box/utilities/utilities_barrel.dart' show inputDecoration, InputValidator;
import 'package:beats_box/constants/constants_barrel.dart' show AppStrings, AppSizes, AppColors, AppPaddings;

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

  Widget showButtonOrSpinner(TextTheme textTheme) {
    return isLoading
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
              child: Text(
                AppStrings.register,
                style: textTheme.labelMedium!.copyWith(color: AppColors.slightlyWhite),
              ),
            ),
          );
  }

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
          Text(AppStrings.createAccount, style: textTheme.titleMedium!.copyWith(color: AppColors.slightlyWhite)),
          AppSizes.s36.sizedBoxHeight,
          TextFormField(
            maxLength: 50,
            autocorrect: false,
            cursorHeight: AppSizes.s24,
            keyboardType: TextInputType.text,
            controller: fullNameInputController,
            textCapitalization: TextCapitalization.words,
            validator: (String? value) => InputValidator.fullNameValidation(value),
            onTapOutside: (PointerDownEvent event) => FocusManager.instance.primaryFocus?.unfocus(),
            style: textTheme.labelMedium!.copyWith(color: AppColors.slightlyWhite),
            decoration: inputDecoration(
              colorTheme: colorScheme,
              helperText: AppStrings.empty,
              labelText: AppStrings.fullName,
              inputLabelColor: AppColors.slightlyWhite,
              rightIcon: const Icon(
                Icons.person,
                size: AppSizes.s20,
                color: AppColors.lessLightTeal,
              ),
            ),
          ),
          AppSizes.s16.sizedBoxHeight,
          TextFormField(
            autocorrect: false,
            cursorHeight: AppSizes.s24,
            controller: emailInputController,
            keyboardType: TextInputType.emailAddress,
            validator: (String? value) => InputValidator.emailValidation(value),
            onTapOutside: (PointerDownEvent event) => FocusManager.instance.primaryFocus?.unfocus(),
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
            validator: (String? value) {
              passwordValue = value;
              return InputValidator.passwordValidation(value);
            },
            onTapOutside: (PointerDownEvent event) => FocusManager.instance.primaryFocus?.unfocus(),
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
          AppSizes.s16.sizedBoxHeight,
          TextFormField(
            autocorrect: false,
            cursorHeight: AppSizes.s24,
            obscureText: !isConfirmPasswordVisible,
            keyboardType: TextInputType.text,
            enableInteractiveSelection: false,
            controller: confirmPasswordInputController,
            onTapOutside: (PointerDownEvent event) => FocusManager.instance.primaryFocus?.unfocus(),
            validator: (String? value) => InputValidator.confirmPasswordValidation(passwordValue, value),
            style: textTheme.labelMedium!.copyWith(decorationThickness: 0, color: AppColors.slightlyWhite),
            decoration: inputDecoration(
              colorTheme: colorScheme,
              helperText: AppStrings.empty,
              labelText: AppStrings.confirmPassword,
              inputLabelColor: AppColors.slightlyWhite,
              rightIcon: IconButton(
                color: AppColors.lessLightTeal,
                onPressed: toggleConfirmPassword,
                icon: Icon(isConfirmPasswordVisible ? Icons.visibility_off : Icons.visibility, size: AppSizes.s20),
              ),
            ),
          ),
          AppSizes.s24.sizedBoxHeight,
          ElevatedButton(
            onPressed: onRegisterPress,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.purpleMain,
              padding: const EdgeInsets.symmetric(vertical: AppPaddings.p2, horizontal: AppPaddings.p10),
            ),
            child: showButtonOrSpinner(textTheme),
          ),
        ],
      ),
    );
  }
}
