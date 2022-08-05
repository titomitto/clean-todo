import 'package:clean_todo/core/presentation/view_models/view_model.dart';
import 'package:clean_todo/core/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';

import '../view.dart';

abstract class Screen<VM extends ViewModel> extends StatefulWidget {
  final VM viewModel = getIt();
  Screen({
    Key? key,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return Container();
  }

  @override
  State<StatefulWidget> createState() => ViewState();

  String get routeName;
}
