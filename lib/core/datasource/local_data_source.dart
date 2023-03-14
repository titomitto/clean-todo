abstract class LocalDataSource {
  Future<void> init();
  Future<void> close();
  Future<void> clear();
}
