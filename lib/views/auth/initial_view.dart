import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart' show ReadContext, BlocConsumer;

import 'package:beats_box/bloc/auth/auth_bloc.dart';
import 'package:beats_box/bloc/auth/auth_event.dart';
import 'package:beats_box/bloc/auth/auth_state.dart' show AuthState, IsLoggedIn, IsLoggedOut;
import 'package:beats_box/views/views_barrel.dart' show HomeView, LoginView;
import 'package:beats_box/constants/constants_barrel.dart' show AppColors;

class InitialView extends StatelessWidget {
  const InitialView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<AuthBloc>().add(const CheckIsLoggedIn());

    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        debugPrint("Main auth state ${state.isLoading}");
      },
      builder: (context, state) {
        if (state is IsLoggedIn) {
          return const HomeView();
        } else if (state is IsLoggedOut) {
          return const LoginView();
        } else {
          return const Placeholder(color: AppColors.transparent);
        }
      },
    );
  }
}
