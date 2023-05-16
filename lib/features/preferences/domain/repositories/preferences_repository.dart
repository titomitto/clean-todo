import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/preferences.dart';

abstract class PreferencesRepository {
  Future<Either<Failure, Preferences?>> getPreferences();
  Future<Either<Failure, Unit>> setPreferences(Preferences preferences);
}
