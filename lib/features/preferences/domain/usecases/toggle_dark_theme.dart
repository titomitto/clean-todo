import 'package:clean_todo/core/usecases/usecase.dart';
import 'package:clean_todo/core/errors/failure.dart';
import 'package:clean_todo/features/preferences/domain/repositories/preferences_repository.dart';
import 'package:dartz/dartz.dart' hide Task;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/preferences_repository_impl.dart';
import '../entities/preferences.dart';

final toggleDarkModeUseCaseProvider = Provider<ToggleDarkModeUseCase>((ref) {
  final repository = ref.read(preferencesRepositoryProvider);
  return ToggleDarkModeUseCase(repository: repository);
});

class ToggleDarkModeUseCase
    extends NoParamsUseCase<Future<Either<Failure, void>>> {
  PreferencesRepository repository;

  ToggleDarkModeUseCase({
    required this.repository,
  });

  @override
  Future<Either<Failure, Unit>> call() async {
    var response = await repository.getPreferences();
    return response.fold((l) => Left(l), (preferences) {
      preferences ??= Preferences(
        language: "en",
        darkModeEnabled: true,
      );

      return repository.savePreferences(preferences);
    });
  }
}
