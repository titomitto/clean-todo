import 'package:clean_todo/core/domain/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:clean_todo/core/failure/failure.dart';

class AddCount extends UseCase<int, AddCountParams> {
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
