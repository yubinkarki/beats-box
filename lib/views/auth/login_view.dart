import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'package:beats_box/bloc/auth/auth_barrel.dart' show AuthBloc, SignInWithGoogle;
import 'package:beats_box/globals/globals_barrel.dart';
import "package:beats_box/widgets/widgets_barrel.dart";
import 'package:beats_box/services/services_barrel.dart';
import 'package:beats_box/constants/constants_barrel.dart';
import 'package:beats_box/utilities/utilities_barrel.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool _passwordVisible = false;

  final _loginFormKey = GlobalKey<FormState>();
  late final TextEditingController _emailInputController;
  late final TextEditingController _passwordInputController;

  @override
  void initState() {
    super.initState();
    _emailInputController = TextEditingController();
    _passwordInputController = TextEditingController();
  }

  void _dismissKeyboard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

  void _togglePassword() {
    setState(() => _passwordVisible = !_passwordVisible);
  }

  void handleNavToRegister() {
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

      await customMiliDelay(200);

      if (!context.mounted) return;

      return showCustomGenericDialog<void>(
        title: "This is input data",
        content: email + password,
        context: context,
        optionsBuilder: () => {"Ok": null},
      );
    }

    return Scaffold(
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
                  loginFormKey: _loginFormKey,
                  onLoginPress: handleLogin,
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
                    onPressed: () => authBloc.add(const SignInWithGoogle()),
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
    );
  }
}
