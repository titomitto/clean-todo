import 'package:clean_todo/core/core.dart';
import 'package:dartz/dartz.dart' hide Task;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../preferences.dart';

final preferencesRepositoryProvider =
    Provider.autoDispose<PreferencesRepository>((ref) {
  final preferencesLocalDataSource =
      ref.watch(preferencesLocalDataSourceProvider.future);
  return PreferencesRepositoryImpl(
      futureLocalDataSource: preferencesLocalDataSource);
});

class PreferencesRepositoryImpl extends PreferencesRepository {
  Future<PreferencesLocalDataSource> futureLocalDataSource;

  PreferencesRepositoryImpl({
    required this.futureLocalDataSource,
  });

  @override
  Future<Either<Failure, Preferences?>> getPreferences() async {
    try {
      final localDataSource = await futureLocalDataSource;
      var preferencesModel = await localDataSource.getPreferences();
      var preferences = preferencesModel?.toEntity();
      return Right(preferences);
    } catch (e) {
      return Left(CacheGetFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> setPreferences(Preferences preferences) async {
    try {
      final localDataSource = await futureLocalDataSource;
      await localDataSource.setPreferences(preferences.toModel());
      return const Right(unit);
    } catch (e) {
      return Left(CachePutFailure());
    }
  }
}
