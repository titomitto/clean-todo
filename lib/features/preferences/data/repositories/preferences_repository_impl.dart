import 'dart:developer';

import 'package:clean_todo/core/errors/failure.dart';
import 'package:clean_todo/features/preferences/data/datasources/preferences_local_datasource.dart';
import 'package:clean_todo/features/preferences/domain/entities/preferences.dart';
import 'package:clean_todo/features/preferences/data/mappers/preferences.dart';
import 'package:dartz/dartz.dart' hide Task;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/repositories/preferences_repository.dart';

final preferencesRepositoryProvider = Provider<PreferencesRepository>((ref) {
  return PreferencesRepositoryImpl(ref: ref);
});

class PreferencesRepositoryImpl extends PreferencesRepository {
  Ref ref;

  PreferencesRepositoryImpl({
    required this.ref,
  });

  @override
  Future<Either<Failure, Preferences?>> getPreferences() async {
    try {
      var localDataSource =
          await ref.read(preferencesLocalDataSourceProvider.future);
      var preferencesModel = await localDataSource.getPreferences();
      var preferences = preferencesModel?.toEntity();
      return Right(preferences);
    } catch (e) {
      log("$e");
      return Left(CacheGetFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> savePreferences(Preferences preferences) async {
    try {
      var localDataSource =
          await ref.read(preferencesLocalDataSourceProvider.future);
      await localDataSource.savePreferences(preferences.toModel());
      return const Right(unit);
    } catch (e) {
      return Left(CachePutFailure());
    }
  }
}
