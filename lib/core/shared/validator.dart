import '../errors/failure.dart';

abstract class Validator<T> {
  ValidationFailure? validate(T params);
}
