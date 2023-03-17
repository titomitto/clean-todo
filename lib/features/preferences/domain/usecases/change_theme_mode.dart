import 'package:clean_todo/core/usecases/usecase.dart';
import 'package:clean_todo/core/errors/failure.dart';
import 'package:clean_todo/features/preferences/domain/repositories/preferences_repository.dart';
import 'package:dartz/dartz.dart' hide Task;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/preferences_repository_impl.dart';
import '../entities/preferences.dart';

final changeThemeModeUseCaseProvider = Provider<ChangeThemeModeUseCase>((ref) {
  final repository = ref.read(preferencesRepositoryProvider);
  return ChangeThemeModeUseCase(repository: repository);
});

class ChangeThemeModeUseCase
    extends UseCase<Future<Either<Failure, void>>, ChangeThemeModeParams> {
  PreferencesRepository repository;

  ChangeThemeModeUseCase({
    required this.repository,
  });

  @override
  Future<Either<Failure, Unit>> call(ChangeThemeModeParams params) async {
    var response = await repository.getPreferences();
    return response.fold((l) => Left(l), (preferences) {
      preferences ??= Preferences(
        language: "en",
        themeMode: params.themeMode,
      );

      return repository.savePreferences(preferences);
    });
  }
}

class ChangeThemeModeParams {
  String themeMode;
  ChangeThemeModeParams({
    required this.themeMode,
  });
}
