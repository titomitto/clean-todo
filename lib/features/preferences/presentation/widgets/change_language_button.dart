import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/preferences_controller.dart';

class ChangeLanguageButton extends ConsumerWidget {
  const ChangeLanguageButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var preferencesController =
        ref.watch(preferencesControllerProvider.notifier);
    var preferences = ref.watch(preferencesControllerProvider);
    return PopupMenuButton<String>(
      icon: const Icon(Icons.language),
      onSelected: (value) => preferencesController.changeLanguage(value),
      itemBuilder: (BuildContext context) {
        return ['English', 'Kiswahili']
            .map((language) => PopupMenuItem(
                  value: language,
                  child: Text(language),
                ))
            .toList();
      },
    );
  }
}
