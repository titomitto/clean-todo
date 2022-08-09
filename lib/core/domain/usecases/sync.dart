import 'package:clean_todo/core/domain/usecases/usecase.dart';

abstract class SyncUseCase extends UseCase<SyncResults, NoParams> {
  @override
  SyncResults call([NoParams params = const NoParams()]);
}

class SyncResults {
  bool synced;
  String message;
  SyncResults({
    required this.synced,
    required this.message,
  });
}

class SyncSurveys extends SyncUseCase {
  @override
  SyncResults call([NoParams params = const NoParams()]) {
    return SyncResults(synced: false, message: "Failed to sync");
  }
}
