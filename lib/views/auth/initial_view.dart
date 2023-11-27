import 'package:beats_box/bloc/auth/auth_barrel.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart' show ReadContext, BlocConsumer;

import 'package:beats_box/constants/constants_barrel.dart' show AppColors;
import 'package:beats_box/views/views_barrel.dart' show HomeView, LoginView;
import 'package:beats_box/bloc/blocs_barrel.dart'
    show
        AuthBloc,
        AuthState,
        IsLoggedIn,
        IsLoggedOut,
        Authenticating,
        CheckIsLoggedIn,
        AuthEventInitialize,
        AuthenticationFailure,
        AuthenticationSuccess;

class InitialView extends StatelessWidget {
  const InitialView({super.key});

  @override
  Widget build(BuildContext context) {
    final authBloc = context.read<AuthBloc>();

    authBloc.add(const CheckIsLoggedIn());
    authBloc.add(const AuthEventInitialize());

    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        debugPrint("Main auth state ${state.isLoading}");
      },
      builder: (context, state) {
        if (state is IsLoggedIn || state is AuthenticationSuccess) {
          return const HomeView();
        } else if (state is IsLoggedOut || state is AuthenticationFailure || state is Authenticating) {
          return const LoginView();
        } else {
          return const Placeholder(color: AppColors.darkTeal);
        }
      },
    );
  }
}
