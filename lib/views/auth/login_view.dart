import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart' show BlocProvider, BlocListener;
import 'package:flutter_native_splash/flutter_native_splash.dart' show FlutterNativeSplash;

import 'package:beats_box/utilities/utilities_barrel.dart' show showCustomGenericDialog;
import 'package:beats_box/globals/globals_barrel.dart' show LoadingOverlay, GlobalMediaQuery;
import 'package:beats_box/widgets/widgets_barrel.dart' show LoginForm, customHorizontalLine, SocialLoginButton;
import 'package:beats_box/services/services_barrel.dart'
    show getIt, DoubleExtension, InvalidLoginCredentials, SnackMessengerMixin;
import 'package:beats_box/constants/constants_barrel.dart'
    show AppStrings, AppPaddings, CustomImages, AppSizes, AppRoutes, AppColors;
import 'package:beats_box/bloc/blocs_barrel.dart'
    show AuthBloc, SignInWithGoogle, AuthState, SignInWithCustomEmail, AuthenticationFailure;

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with SnackMessengerMixin {
  bool _isLoading = false;
  bool _passwordVisible = false;

  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  final LoadingOverlay loadingOverlay = getIt.get<LoadingOverlay>();

  late final TextEditingController _emailInputController;
  late final TextEditingController _passwordInputController;

  AutovalidateMode _autoValidate = AutovalidateMode.disabled;

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

    final TextTheme textTheme = Theme.of(context).textTheme;
    final AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);
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
      listener: (BuildContext context, AuthState state) async {
        if (state is AuthenticationFailure) {
          setState(() => _isLoading = false);

          if (state.exception is InvalidLoginCredentials) {
            messenger.showSnackBar(
              actionLabel: AppStrings.details,
              message: AppStrings.invalidLoginCredentialsError,
              onActionPressed: () {
                showCustomGenericDialog<void>(
                  context: context,
                  title: AppStrings.failedToLogin,
                  content: AppStrings.invalidLoginCredentialsDetail,
                  optionsBuilder: () => <String, Null>{AppStrings.ok.toUpperCase(): null},
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
                  content: AppStrings.somethingWentWrongDetail,
                  optionsBuilder: () => <String, Null>{AppStrings.ok.toUpperCase(): null},
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
                children: <Widget>[
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
                      onPressed: handleGoogleLogin,
                      buttonIcon: CustomImages.googleLogo,
                      buttonColor: colorScheme.surface,
                      buttonText: AppStrings.continueWithGoogle,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    AppStrings.noAccount,
                    style: textTheme.labelSmall!.copyWith(color: AppColors.slightlyWhite),
                  ),
                  AppSizes.s6.sizedBoxHeight,
                  OutlinedButton(
                    onPressed: handleNavToRegister,
                    child: Text(
                      AppStrings.register,
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
