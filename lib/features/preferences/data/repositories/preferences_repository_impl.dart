import 'dart:developer';

import 'package:clean_todo/core/core.dart';
import 'package:clean_todo/features/preferences/domain/entities/preferences.dart';
import 'package:dartz/dartz.dart' hide Task;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/repositories/preferences_repository.dart';
import '../data.dart';

final preferencesRepositoryProvider = Provider<PreferencesRepository>((ref) {
  return PreferencesRepositoryImpl(ref: ref);
});

class PreferencesRepositoryImpl extends PreferencesRepository {
  Ref ref;

  PreferencesRepositoryImpl({
    required this.ref,
  });

  @override
  Future<Either<Failure, Preferences>> getPreferences() async {
    try {
      var localDataSource =
          await ref.read(preferencesLocalDataSourceProvider.future);
      var preferencesModel = await localDataSource.getPreferences();
      var preferences = preferencesModel.toEntity();
      return Right(preferences);
    } catch (e) {
      return Left(CacheGetFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> setLanguage(String language) async {
    try {
      var localDataSource =
          await ref.read(preferencesLocalDataSourceProvider.future);
      await localDataSource.setLanguage(language);
      return const Right(unit);
    } catch (e) {
      return Left(CachePutFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> setThemeMode(String themeMode) async {
    try {
      var localDataSource =
          await ref.read(preferencesLocalDataSourceProvider.future);
      await localDataSource.setLanguage(themeMode);
      return const Right(unit);
    } catch (e) {
      return Left(CachePutFailure());
    }
  }
}
