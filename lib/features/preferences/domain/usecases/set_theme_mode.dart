
import 'package:clean_todo/core/usecases/usecase.dart';
import 'package:clean_todo/core/errors/failure.dart';
import 'package:clean_todo/features/preferences/preferences.dart';
import 'package:dartz/dartz.dart' hide Task;
import 'package:flutter_riverpod/flutter_riverpod.dart';

final setThemeModeUseCaseProvider = Provider<SetThemeMode>((ref) {
  final repository = ref.read(preferencesRepositoryProvider);
  return SetThemeMode(repository: repository);
});

class SetThemeMode
    extends UseCase<Future<Either<Failure, void>>, ChangeThemeModeParams> {
  PreferencesRepository repository;

  SetThemeMode({
    required this.repository,
  });

  @override
  Future<Either<Failure, Unit>> call(ChangeThemeModeParams params) async {
    return repository.setThemeMode(params.themeMode);
  }
}

class ChangeThemeModeParams {
  String themeMode;
  ChangeThemeModeParams({
    required this.themeMode,
  });
}
