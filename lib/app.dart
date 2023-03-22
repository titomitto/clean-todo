import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:oktoast/oktoast.dart';

import 'config/theme.dart';
import 'features/preferences/presentation/controllers/preferences_controller.dart';

class App extends ConsumerWidget {
  final String title;
  final GoRouter router;
  const App({
    Key? key,
    required this.title,
    required this.router,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    var preferences = ref.watch(preferencesControllerProvider);
    return OKToast(
      position: ToastPosition.bottom,
      child: MaterialApp.router(
        darkTheme: darkTheme,
        theme: lightTheme,
        themeMode:
            preferences.themeMode == 'light' ? ThemeMode.light : ThemeMode.dark,
        routerConfig: router,
        title: title,
        debugShowCheckedModeBanner: false,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      ),
    );
  }
}
