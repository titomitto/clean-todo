import 'package:clean_todo/core/presentation/view_models/app_view_model.dart';
import 'package:clean_todo/core/utils/service_locator.dart';
import 'package:provider/provider.dart';

get providers => [
      ChangeNotifierProvider<AppViewModel>.value(value: getIt()),
    ];
