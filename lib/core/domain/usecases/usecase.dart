abstract class UseCase<R, P> {
  R call(P params);
}

abstract class NoParamsUseCase<R> {
  R call();
}
