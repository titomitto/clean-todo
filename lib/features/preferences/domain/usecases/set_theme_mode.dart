import 'package:clean_todo/core/usecases/usecase.dart';
import 'package:clean_todo/core/errors/failure.dart';
import 'package:clean_todo/features/preferences/preferences.dart';
import 'package:dartz/dartz.dart' hide Task;
import 'package:flutter_riverpod/flutter_riverpod.dart';

final setThemeModeUseCaseProvider = Provider<SetThemeMode>((ref) {
  final repository = ref.read(preferencesRepositoryProvider);
  return SetThemeMode(repository: repository);
});

class SetThemeMode extends UseCase<void, SetThemeModeParams> {
  PreferencesRepository repository;

  SetThemeMode({
    required this.repository,
  });

  @override
  Future<Either<Failure, Unit>> call(SetThemeModeParams params) async {
    return repository.setPreferences(params.preferences.copyWith(
      themeMode: params.themeMode,
    ));
  }
}

class SetThemeModeParams {
  String themeMode;
  Preferences preferences;
  SetThemeModeParams({
    required this.themeMode,
    required this.preferences,
  });
}
