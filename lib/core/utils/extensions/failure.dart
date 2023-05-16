import 'package:clean_todo/core/core.dart';
import 'package:clean_todo/core/utils/extensions/context.dart';
import 'package:flutter/material.dart';

extension FailureMessage on Failure {
  toMessage(BuildContext context) => mapFailureToMessage(context, this);
}

extension FailureSnackBar on Failure {
  showSnackBar(BuildContext context) =>
      context.showErrorSnackBar(toMessage(context));
}
