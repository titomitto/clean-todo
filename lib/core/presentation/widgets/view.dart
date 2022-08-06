import 'dart:developer';

import 'package:clean_todo/features/todo/presentation/view_models/todos_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../utils/service_locator.dart';
import '../view_models/view_model.dart';

abstract class View<VM extends ViewModel> extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  View({Key? key}) : super(key: key);
  late final VM viewModel;

  @override
  State<View> createState() => ViewState<VM>();

  Widget build(BuildContext context);
}

class ViewState<VM extends ViewModel> extends State<View>
    with RouteAware, WidgetsBindingObserver {
  final VM viewModel = getIt();

  @mustCallSuper
  @override
  void initState() {
    viewModel.onInit();
    super.initState();
  }

  @mustCallSuper
  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    viewModel.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        viewModel.onResume();
        break;
      case AppLifecycleState.paused:
        viewModel.onPause();
        break;
      case AppLifecycleState.inactive:
        viewModel.onInactive();
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TodosViewModel>.value(
      value: viewModel as TodosViewModel,
      builder: (context, w) {
        widget.viewModel ??= Provider.of<VM>(context);
        widget.viewModel.context = context;
        return widget.build(context);
      },
    );
  }
}
