import 'package:clean_todo/core/usecases/usecase.dart';
import 'package:clean_todo/core/errors/failure.dart';
import 'package:clean_todo/features/preferences/preferences.dart';
import 'package:dartz/dartz.dart' hide Task;
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getPreferencesUseCaseProvider =
    Provider.autoDispose<GetPreferences>((ref) {
  final repository = ref.watch(preferencesRepositoryProvider);
  return GetPreferences(repository: repository);
});

class GetPreferences
    extends NoParamsUseCase<Future<Either<Failure, Preferences>>> {
  PreferencesRepository repository;

  GetPreferences({
    required this.repository,
  });

  @override
  Future<Either<Failure, Preferences>> call() async {
    return repository.getPreferences();
  }
}
