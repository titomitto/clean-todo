import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/preferences_controller.dart';

class ChangeLanguageButton extends ConsumerWidget {
  const ChangeLanguageButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var preferencesController = ref.watch(preferencesProvider.notifier);
    return PopupMenuButton<String>(
      icon: const Icon(FeatherIcons.globe),
      onSelected: (value) => preferencesController.changeLanguage(value),
      itemBuilder: (BuildContext context) {
        return ['English', 'Swahili']
            .map((language) => PopupMenuItem(
                  value: language,
                  child: Text(language),
                ))
            .toList();
      },
    );
  }
}
