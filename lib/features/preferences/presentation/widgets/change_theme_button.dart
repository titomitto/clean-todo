import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/preferences_controller.dart';

class AppThemeButton extends ConsumerWidget {
  const AppThemeButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var preferencesController =
        ref.watch(preferencesControllerProvider.notifier);
    return IconButton(
      icon: const Icon(Icons.brightness_2),
      onPressed: () => preferencesController.toggleTheme(),
    );
  }
}
