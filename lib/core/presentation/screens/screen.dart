import 'package:flutter/src/foundation/key.dart';

import '../view.dart';

abstract class Screen extends View {
  Screen({Key? key}) : super(key: key);

  String get routeName;
}
