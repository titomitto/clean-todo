import 'package:clean_todo/core/domain/usecases/usecase.dart';

class AddTodo extends UseCase<int, AddCountParams> {
  @override
  int call(AddCountParams params) {
    return params.count + 1;
  }
}

class AddCountParams {
  int count;
  AddCountParams({
    required this.count,
  });
}
