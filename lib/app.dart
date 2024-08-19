import 'package:flutter/material.dart'
    show StatelessWidget, Widget, BuildContext, LayoutBuilder, MaterialApp, ThemeMode, BoxConstraints;

import 'package:flutter_bloc/flutter_bloc.dart' show MultiBlocProvider, BlocProvider;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' show FlutterSecureStorage;

import 'package:beats_box/bloc/auth/auth_bloc.dart' show AuthBloc;
import 'package:beats_box/services/services_barrel.dart' show getIt;
import 'package:beats_box/repositories/auth_repo.dart' show AuthRepo;
import 'package:beats_box/navigations/navigations_barrel.dart' show AppRouter;
import 'package:beats_box/themes/themes_barrel.dart' show lightTheme, darkTheme;
import 'package:beats_box/services/services_barrel.dart' show FirebaseAuthProvider;
import 'package:beats_box/constants/constants_barrel.dart' show AppRoutes, AppStrings;
import 'package:beats_box/globals/globals_barrel.dart' show GlobalMediaQuery, GlobalKeys;

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final FlutterSecureStorage storage = getIt.get<FlutterSecureStorage>();

    return MultiBlocProvider(
      providers: <BlocProvider<dynamic>>[
        BlocProvider<AuthBloc>(
          create: (BuildContext context) =>
              AuthBloc(authRepo: AuthRepo(), provider: FirebaseAuthProvider(), storage: storage),
        ),
      ],
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          GlobalMediaQuery.init(context);

          return MaterialApp(
            title: AppStrings.appTitle,
            theme: lightTheme(context),
            themeMode: ThemeMode.system,
            darkTheme: darkTheme(context),
            initialRoute: AppRoutes.initial,
            debugShowCheckedModeBanner: true,
            onGenerateRoute: AppRouter.getRoute,
            scaffoldMessengerKey: GlobalKeys.scaffoldMessengerKey,
          );
        },
      ),
    );
  }
}
