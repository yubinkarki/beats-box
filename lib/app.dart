import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:beats_box/bloc/auth/auth_bloc.dart' show AuthBloc;
import 'package:beats_box/globals/globals_barrel.dart' show GlobalMediaQuery;
import 'package:beats_box/navigations/navigations_barrel.dart' show AppRouter;
import 'package:beats_box/themes/themes_barrel.dart' show lightTheme, darkTheme;
import "package:beats_box/constants/constants_barrel.dart" show AppRoutes, AppStrings;

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (context) => AuthBloc()),
      ],
      child: LayoutBuilder(
        builder: (context, constraints) {
          GlobalMediaQuery.init(context);

          return MaterialApp(
            title: AppStrings.appTitle,
            theme: lightTheme(context),
            themeMode: ThemeMode.system,
            darkTheme: darkTheme(context),
            initialRoute: AppRoutes.initial,
            debugShowCheckedModeBanner: true,
            onGenerateRoute: AppRouter.getRoute,
          );
        },
      ),
    );
  }
}
