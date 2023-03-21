import 'dart:developer';

import 'package:clean_todo/core/core.dart';
import 'package:clean_todo/features/preferences/domain/entities/preferences.dart';
import 'package:dartz/dartz.dart' hide Task;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/repositories/preferences_repository.dart';
import '../data.dart';

final preferencesRepositoryProvider =
    FutureProvider<PreferencesRepository>((ref) async {
  final preferencesLocalDataSource =
      await ref.read(preferencesLocalDataSourceProvider.future);
  return PreferencesRepositoryImpl(localDataSource: preferencesLocalDataSource);
});

class PreferencesRepositoryImpl extends PreferencesRepository {
  PreferencesLocalDataSource localDataSource;

  PreferencesRepositoryImpl({
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, Preferences>> getPreferences() async {
    try {
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
      await localDataSource.setLanguage(language);
      return const Right(unit);
    } catch (e) {
      return Left(CachePutFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> setThemeMode(String themeMode) async {
    try {
      await localDataSource.setLanguage(themeMode);
      return const Right(unit);
    } catch (e) {
      return Left(CachePutFailure());
    }
  }
}
