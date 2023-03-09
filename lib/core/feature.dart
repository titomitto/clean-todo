
import 'package:clean_todo/core/presentation/app_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

abstract class Feature {
  List<RouteBase> routes = [];
  Future<void> preregister() async {}
}
