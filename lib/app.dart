import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import 'config/constants.dart';
import 'config/go_router.dart';
import 'config/theme.dart';
import 'features/preferences/presentation/controllers/preferences_controller.dart';

class App extends ConsumerWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final router = ref.watch(goRouterProvider);
    var preferences = ref.watch(preferencesProvider);
    return MaterialApp.router(
      darkTheme: darkTheme,
      theme: lightTheme,
      themeMode:
          preferences.themeMode == 'light' ? ThemeMode.light : ThemeMode.dark,
      routerConfig: router,
      title: appTitle,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(preferences.language),
    );
  }
}
