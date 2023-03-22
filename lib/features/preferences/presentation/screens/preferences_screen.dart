import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../tasks/presentation/screens/tasks_screen.dart';

class PreferencesScreen extends ConsumerWidget {
  static const routePath = '/preferences';
  const PreferencesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: Center(
      child: GestureDetector(
        onTap: () => context.go(TasksScreen.routePath),
        child: const Text('Preferences'),
      ),
    ));
  }
}
