import 'package:clean_todo/core/presentation/viewmodels/view_model.dart';
import 'package:flutter/material.dart';

import '../widgets/view.dart';

abstract class Screen<VM extends ViewModel> extends View<VM> {
  Screen({Key? key}) : super(key: key);

  String get routeName;
}
