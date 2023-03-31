import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../controllers/preferences_controller.dart';

class AppThemeButton extends ConsumerWidget {
  const AppThemeButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var preferencesController = ref.watch(preferencesProvider.notifier);
    var isDark = ref.watch(preferencesProvider).themeMode == 'dark';

    return IconButton(
      icon: Icon(isDark ? FeatherIcons.sun : FeatherIcons.moon),
      onPressed: () => preferencesController.toggleTheme(),
    );
  }
}
