import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import '../viewmodels/view_model.dart';

abstract class View<VM extends ViewModel> extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  View({Key? key}) : super(key: key);

  @override
  State<View> createState() => ViewState<VM>();

  Widget build(BuildContext context, VM viewModel);
}

class ViewState<VM extends ViewModel> extends State<View>
    with RouteAware, WidgetsBindingObserver {
  final VM viewModel = GetIt.I<VM>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @mustCallSuper
  @override
  void initState() {
    viewModel.onInit();
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @mustCallSuper
  @override
  void dispose() {
    log("Disposing.... VM");
    WidgetsBinding.instance.removeObserver(this);
    viewModel.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print("STATE CHANGED $state");
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
    return ChangeNotifierProvider<VM>.value(
      value: viewModel,
      builder: (context, w) {
        viewModel.context = context;
        return widget.build(context, viewModel);
      },
    );
  }
}
