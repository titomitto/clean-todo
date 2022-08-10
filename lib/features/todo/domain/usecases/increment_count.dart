import 'package:clean_todo/core/domain/usecases/usecase.dart';

class DeleteTodo extends UseCase<int, DecrementCountParams> {
  @override
  int call(DecrementCountParams params) {
    return params.count - 1;
  }
}

class DecrementCountParams {
  int count;
  DecrementCountParams({
    required this.count,
  });
}
