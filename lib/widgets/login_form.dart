import 'package:flutter/material.dart';

import 'package:beats_box/services/services_barrel.dart';
import 'package:beats_box/constants/constants_barrel.dart';
import 'package:beats_box/utilities/utilities_barrel.dart' show inputDecoration;

class LoginForm extends StatelessWidget {
  final bool isPasswordVisible;
  final VoidCallback onLoginPress;
  final VoidCallback togglePassword;
  final GlobalKey<FormState> loginFormKey;
  final TextEditingController emailInputController;
  final TextEditingController passwordInputController;

  const LoginForm({
    super.key,
    required this.loginFormKey,
    required this.onLoginPress,
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
            onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
            decoration: inputDecoration(
              rightIcon: const Icon(Icons.email, size: AppSizes.s20),
              colorTheme: colorScheme,
              labelText: AppStrings.email,
              helperText: AppStrings.empty,
            ),
          ),
          AppSizes.s10.sizedBoxHeight,
          TextFormField(
            autocorrect: false,
            cursorHeight: AppSizes.s24,
            obscureText: !isPasswordVisible,
            keyboardType: TextInputType.text,
            enableInteractiveSelection: false,
            controller: passwordInputController,
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
          AppSizes.s16.sizedBoxHeight,
          ElevatedButton(
            onPressed: onLoginPress,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.purpleMain,
              padding: const EdgeInsets.symmetric(vertical: AppPaddings.p8, horizontal: AppPaddings.p20),
            ),
            child: Text(AppStrings.login, style: textTheme.labelMedium),
          )
        ],
      ),
    );
  }
}
