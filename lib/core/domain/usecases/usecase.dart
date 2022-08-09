abstract class UseCase<R, P> {
  R call(P params);
}

class NoParams {
  const NoParams();
}
