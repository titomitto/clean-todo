import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import '../viewmodels/view_model.dart';

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
  final VM viewModel = GetIt.I<VM>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  void setViewModel() {
    setState(() {
      widget.viewModel = viewModel;
      widget.viewModel.context = context;
    });
  }

  @mustCallSuper
  @override
  void initState() {
    setViewModel();
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
    return ChangeNotifierProvider<VM>.value(
      value: viewModel,
      builder: (context, w) {
        return widget.build(context);
      },
    );
  }
}
