import 'package:clean_todo/core/initializer.dart';
import 'config/injectors.dart';

void main() async {
  await Initializer(
    title: "Todo Tasks",
    defaultRoute: "/",
    injectors: featureInjectors,
  ).init();
}
