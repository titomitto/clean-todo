import 'package:clean_todo/core/domain/usecases/usecase.dart';

class IncrementCount extends UseCase<int, IncrementCountParams> {
  @override
  int call(IncrementCountParams params) {
    return params.count - 1;
  }
}

class IncrementCountParams {
  int count;
  IncrementCountParams({
    required this.count,
  });
}
