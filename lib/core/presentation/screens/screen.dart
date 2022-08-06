import 'package:clean_todo/core/presentation/view_models/view_model.dart';
import 'package:flutter/material.dart';

import '../widgets/view.dart';

abstract class Screen<VM extends ViewModel> extends View<VM> {
  Screen({Key? key}) : super(key: key);
  @override
  ViewState<VM> createState() => ViewState<VM>();

  String get routeName;
}
