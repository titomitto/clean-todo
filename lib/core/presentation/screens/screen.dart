import 'dart:developer';

import 'package:clean_todo/core/presentation/view_models/view_model.dart';
import 'package:clean_todo/core/utils/service_locator.dart';
import 'package:clean_todo/features/todo/presentation/view_models/todos_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:provider/provider.dart';

import '../widgets/view.dart';

abstract class Screen<VM extends ViewModel> extends View<VM> {
  Screen({Key? key}) : super(key: key);
  @override
  ViewState<VM> createState() => ViewState<VM>();

  String get routeName;
}
