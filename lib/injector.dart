import 'package:clean_todo/core/presentation/view_models/app_view_model.dart';

import 'core/utils/service_locator.dart';

initialize() {
  getIt.registerSingleton<AppViewModel>(AppViewModel());
}
