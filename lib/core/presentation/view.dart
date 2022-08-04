import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../utils/service_locator.dart';
import 'view_models/view_model.dart';

final RouteObserver<ModalRoute<void>> routeObserver =
    RouteObserver<ModalRoute<void>>();

class View<VM extends ViewModel> extends StatefulWidget {
  final VM viewModel = getIt();
  View({
    Key? key,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return Container();
  }

  @override
  State<StatefulWidget> createState() => ViewState();
}

class ViewState<V extends View> extends State<V>
    with RouteAware, WidgetsBindingObserver {
  get viewModel => widget.viewModel;

  String get _sanitisedRoutePageName {
    return '$runtimeType'.replaceAll('_', '').replaceAll('State', '');
  }

  @mustCallSuper
  ViewState() {
    log('Created $runtimeType.');
  }

  @mustCallSuper
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    viewModel.context = context;
    viewModel.onInit();
  }

  @mustCallSuper
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // subscribe for the change of route
    if (ModalRoute.of(context) != null) {
      routeObserver.subscribe(this, ModalRoute.of(context) as PageRoute);
    }
  }

  /// Called when the top route has been popped off, and the current route
  /// shows up.
  @mustCallSuper
  @override
  void didPopNext() {
    log('$_sanitisedRoutePageName didPopNext');
    viewModel.routingDidPopNext();
  }

  /// Called when the current route has been pushed.
  @mustCallSuper
  @override
  void didPush() {
    log('$_sanitisedRoutePageName didPush');
    viewModel.routingDidPush();
  }

  /// Called when the current route has been popped off.
  @mustCallSuper
  @override
  void didPop() {
    log('$_sanitisedRoutePageName didPop');
    viewModel.routingDidPop();
  }

  /// Called when a new route has been pushed, and the current route is no
  /// longer visible.
  @mustCallSuper
  @override
  void didPushNext() {
    log('$_sanitisedRoutePageName didPushNext');
    viewModel.routingDidPushNext();
  }

  @mustCallSuper
  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    if (ModalRoute.of(context) != null) {
      routeObserver.unsubscribe(this);
    }
    log('Disposing $runtimeType.');
    viewModel.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        log("HSSJJAKA");
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
    return widget.build(context);
  }
}
