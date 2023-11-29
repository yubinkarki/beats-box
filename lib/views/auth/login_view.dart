import 'package:beats_box/bloc/auth/auth_barrel.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'package:beats_box/globals/globals_barrel.dart';
import "package:beats_box/widgets/widgets_barrel.dart";
import 'package:beats_box/services/services_barrel.dart';
import 'package:beats_box/constants/constants_barrel.dart';
import 'package:beats_box/utilities/utilities_barrel.dart';
import 'package:beats_box/bloc/blocs_barrel.dart' show AuthBloc, SignInWithGoogle, AuthState, SignInWithCustomEmail;

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool _isLoading = false;
  bool _passwordVisible = false;

  final _loginFormKey = GlobalKey<FormState>();
  late final TextEditingController _emailInputController;
  late final TextEditingController _passwordInputController;

  AutovalidateMode _autoValidate = AutovalidateMode.disabled;

  final loadingOverlay = getIt.get<LoadingOverlay>();

  @override
  void initState() {
    super.initState();
    _emailInputController = TextEditingController();
    _passwordInputController = TextEditingController();
  }

  void _togglePassword() {
    setState(() => _passwordVisible = !_passwordVisible);
  }

  void handleNavToRegister() {
    _loginFormKey.currentState?.reset();
    setState(() => _autoValidate = AutovalidateMode.disabled);
    Navigator.of(context).pushNamed(AppRoutes.register);
  }

  @override
  void dispose() {
    super.dispose();
    _emailInputController.dispose();
    _passwordInputController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();

    final authBloc = BlocProvider.of<AuthBloc>(context);

    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    Future<void> handleLogin() async {
      final String email = _emailInputController.text;
      final String password = _passwordInputController.text;

      if (_loginFormKey.currentState?.validate() ?? false) {
        setState(() => _isLoading = true);
        authBloc.add(SignInWithCustomEmail(email, password));
      } else {
        setState(() => _autoValidate = AutovalidateMode.onUserInteraction);
      }
    }

    void handleGoogleLogin() {
      _loginFormKey.currentState?.reset();
      setState(() => _autoValidate = AutovalidateMode.disabled);
      authBloc.add(const SignInWithGoogle());
    }

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) async {
        if (state is AuthenticationFailure) {
          setState(() => _isLoading = false);

          if (state.exception is UserNotFoundAuthException) {
            showCustomGenericDialog<void>(
              context: context,
              title: AppStrings.failed,
              optionsBuilder: () => {"Ok": null},
              content: AppStrings.userNotFoundError,
            );
          } else if (state.exception is InvalidLoginCredentials) {
            showCustomGenericDialog<void>(
              context: context,
              title: AppStrings.failed,
              optionsBuilder: () => {"Ok": null},
              content: AppStrings.invalidLoginCredentialsError,
            );
          } else {
            showCustomGenericDialog<void>(
              context: context,
              title: AppStrings.failed,
              optionsBuilder: () => {"Ok": null},
              content: AppStrings.somethingWentWrong,
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
                  LoginForm(
                    isLoading: _isLoading,
                    onLoginPress: handleLogin,
                    loginFormKey: _loginFormKey,
                    autoValidate: _autoValidate,
                    togglePassword: _togglePassword,
                    isPasswordVisible: _passwordVisible,
                    emailInputController: _emailInputController,
                    passwordInputController: _passwordInputController,
                  ),
                  AppSizes.s40.sizedBoxHeight,
                  customHorizontalLine(),
                  AppSizes.s40.sizedBoxHeight,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: AppPaddings.p20),
                    child: SocialLoginButton(
                      textTheme: textTheme,
                      buttonIcon: CustomImages.googleLogo,
                      buttonColor: colorScheme.background,
                      buttonText: AppStrings.continueWithGoogle,
                      onPressed: handleGoogleLogin,
                    ),
                  ),
                  const Spacer(),
                  Text(AppStrings.noAccount, style: textTheme.labelSmall),
                  AppSizes.s6.sizedBoxHeight,
                  OutlinedButton(
                    onPressed: handleNavToRegister,
                    child: Text(AppStrings.register, style: textTheme.labelSmall),
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
