import 'package:clean_todo/core/domain/usecases/usecase.dart';

class AddTodo extends UseCase<int, AddTodoParams> {
  @override
  int call(AddTodoParams params) {
    return params.count + 1;
  }
}

class AddTodoParams {
  int count;
  AddTodoParams({
    required this.count,
  });
}
