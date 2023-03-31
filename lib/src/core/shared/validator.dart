class Validator<T> {
  List<ValidationError> validate(T t) {
    return [];
  }
}

class ValidationError {
  final String field;
  final String message;
  ValidationError(this.field, this.message);
}
