import 'package:clean_todo/core/usecases/usecase.dart';
import 'package:clean_todo/core/errors/failure.dart';
import 'package:clean_todo/features/preferences/preferences.dart';
import 'package:dartz/dartz.dart' hide Task;
import 'package:flutter_riverpod/flutter_riverpod.dart';

final setLanguageUseCaseProvider = FutureProvider<SetLanguage>((ref) async {
  final repository = await ref.read(preferencesRepositoryProvider.future);
  return SetLanguage(repository: repository);
});

class SetLanguage
    extends UseCase<Future<Either<Failure, void>>, SetLanguageParams> {
  PreferencesRepository repository;

  SetLanguage({
    required this.repository,
  });

  @override
  Future<Either<Failure, Unit>> call(SetLanguageParams params) async {
    return repository.setLanguage(params.language);
  }
}

class SetLanguageParams {
  String language;
  SetLanguageParams({
    required this.language,
  });
}
