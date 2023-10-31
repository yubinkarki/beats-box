import 'package:flutter/material.dart';

import 'package:beats_box/globals/media_query.dart';
import "package:beats_box/widgets/widgets_barrel.dart";
import 'package:beats_box/services/services_barrel.dart';
import 'package:beats_box/constants/constants_barrel.dart';
import 'package:beats_box/utilities/utilities_barrel.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  bool _passwordVisible = false;
  bool _confirmPasswordVisible = false;

  final _registerFormKey = GlobalKey<FormState>();
  late final TextEditingController _emailInputController;
  late final TextEditingController _fullNameInputController;
  late final TextEditingController _passwordInputController;
  late final TextEditingController _confirmPasswordInputController;

  @override
  void initState() {
    super.initState();
    _emailInputController = TextEditingController();
    _fullNameInputController = TextEditingController();
    _passwordInputController = TextEditingController();
    _confirmPasswordInputController = TextEditingController();
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

  void _toggleConfirmPassword() {
    setState(() => _confirmPasswordVisible = !_confirmPasswordVisible);
  }

  Future<void> handleRegister() async {
    final String email = _emailInputController.text;
    final String fullName = _fullNameInputController.text;
    final String password = _passwordInputController.text;
    final String confirmPassword = _confirmPasswordInputController.text;

    return showCustomGenericDialog<void>(
      context: context,
      title: "This is input data",
      optionsBuilder: () => {"Ok": null},
      content: email + password + fullName + confirmPassword,
    );
  }

  void handleBackToLogin() {
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
    final TextTheme textTheme = Theme.of(context).textTheme;

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
                RegisterForm(
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
                Text(AppStrings.alreadyHaveAccount, style: textTheme.labelSmall),
                AppSizes.s6.sizedBoxHeight,
                OutlinedButton(
                  onPressed: handleBackToLogin,
                  child: Text(AppStrings.login, style: textTheme.labelSmall),
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
