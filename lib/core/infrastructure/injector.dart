import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

abstract class Injector {
  List<RouteBase> routes = [];
  Future<void> preregister() async {}
}
