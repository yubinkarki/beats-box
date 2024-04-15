import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart' show BlocProvider, BlocListener;

import "package:beats_box/widgets/widgets_barrel.dart" show RegisterForm;
import 'package:beats_box/globals/globals_barrel.dart' show GlobalMediaQuery;
import 'package:beats_box/bloc/blocs_barrel.dart' show AuthBloc, AuthState, RegisterWithCustomEmail;
import 'package:beats_box/bloc/auth/auth_state.dart' show AccountCreationSuccess, AuthenticationFailure;
import "package:beats_box/utilities/utilities_barrel.dart" show customMiliDelay, showCustomGenericDialog;
import 'package:beats_box/constants/constants_barrel.dart'
    show AppStrings, AppPaddings, CustomImages, AppSizes, AppColors;
import 'package:beats_box/services/services_barrel.dart'
    show DoubleExtension, EmailAlreadyUsedAuthException, StringExtension, SnackMessengerMixin;

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> with SnackMessengerMixin {
  bool _isLoading = false;
  bool _passwordVisible = false;
  bool _confirmPasswordVisible = false;

  final _registerFormKey = GlobalKey<FormState>();
  late final TextEditingController _emailInputController;
  late final TextEditingController _fullNameInputController;
  late final TextEditingController _passwordInputController;
  late final TextEditingController _confirmPasswordInputController;

  AutovalidateMode _autoValidate = AutovalidateMode.disabled;

  @override
  void initState() {
    super.initState();
    _emailInputController = TextEditingController();
    _fullNameInputController = TextEditingController();
    _passwordInputController = TextEditingController();
    _confirmPasswordInputController = TextEditingController();
  }

  void _togglePassword() {
    setState(() => _passwordVisible = !_passwordVisible);
  }

  void _toggleConfirmPassword() {
    setState(() => _confirmPasswordVisible = !_confirmPasswordVisible);
  }

  void handleBackToLogin() {
    _registerFormKey.currentState?.reset();
    setState(() => _autoValidate = AutovalidateMode.disabled);
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    super.dispose();
    _emailInputController.dispose();
    _passwordInputController.dispose();
    _fullNameInputController.dispose();
    _confirmPasswordInputController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authBloc = BlocProvider.of<AuthBloc>(context);
    final TextTheme textTheme = Theme.of(context).textTheme;

    Future<void> handleRegister() async {
      final String email = _emailInputController.text;
      final String password = _passwordInputController.text;
      final String fullName = _fullNameInputController.text.toTitleCase;

      await customMiliDelay(300);

      if (!context.mounted) return;

      if (_registerFormKey.currentState?.validate() ?? false) {
        setState(() => _isLoading = true);
        authBloc.add(RegisterWithCustomEmail(email, password, fullName));
      } else {
        setState(() => _autoValidate = AutovalidateMode.onUserInteraction);
      }
    }

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AccountCreationSuccess) {
          setState(() => _isLoading = false);

          messenger.showSnackBar(
            actionLabel: AppStrings.ok,
            message: AppStrings.accountCreationSuccess,
            onActionPressed: () => handleBackToLogin(),
          );
        } else if (state is AuthenticationFailure) {
          setState(() => _isLoading = false);

          if (state.exception is EmailAlreadyUsedAuthException) {
            messenger.showSnackBar(
              actionLabel: AppStrings.details,
              message: AppStrings.emailAlreadyUsedError,
              onActionPressed: () {
                showCustomGenericDialog<void>(
                  context: context,
                  title: AppStrings.failedToCreateAccount,
                  optionsBuilder: () => {AppStrings.ok.toUpperCase(): null},
                  content: AppStrings.emailAlreadyUsedError,
                );
              },
            );
          } else {
            messenger.showSnackBar(
              actionLabel: AppStrings.details,
              message: AppStrings.somethingWentWrong,
              onActionPressed: () {
                showCustomGenericDialog<void>(
                  context: context,
                  title: AppStrings.failedToLogin,
                  content: AppStrings.somethingWentWrong,
                  optionsBuilder: () => {AppStrings.ok.toUpperCase(): null},
                );
              },
            );
          }
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: GlobalMediaQuery.screenWidth,
          height: GlobalMediaQuery.screenHeight,
          decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage(CustomImages.authBackground), fit: BoxFit.cover),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPaddings.p20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RegisterForm(
                    isLoading: _isLoading,
                    autoValidate: _autoValidate,
                    onRegisterPress: handleRegister,
                    togglePassword: _togglePassword,
                    registerFormKey: _registerFormKey,
                    isPasswordVisible: _passwordVisible,
                    emailInputController: _emailInputController,
                    toggleConfirmPassword: _toggleConfirmPassword,
                    isConfirmPasswordVisible: _confirmPasswordVisible,
                    passwordInputController: _passwordInputController,
                    fullNameInputController: _fullNameInputController,
                    confirmPasswordInputController: _confirmPasswordInputController,
                  ),
                  const Spacer(),
                  Text(
                    AppStrings.alreadyHaveAccount,
                    style: textTheme.labelSmall!.copyWith(
                      color: AppColors.slightlyWhite,
                    ),
                  ),
                  AppSizes.s6.sizedBoxHeight,
                  OutlinedButton(
                    onPressed: handleBackToLogin,
                    child: Text(
                      AppStrings.login,
                      style: textTheme.labelSmall!.copyWith(color: AppColors.slightlyWhite),
                    ),
                  ),
                  AppSizes.s20.sizedBoxHeight,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
