import 'package:flutter/material.dart';

abstract class ViewModel extends ChangeNotifier {
  late BuildContext context;

  /// This method is executed exactly once for each State object Flutter's
  ///  framework creates.
  void onInit() {}

  ///  This method is executed whenever the Widget's Stateful State gets
  /// disposed. It might happen a few times, always matching the amount
  /// of times `onInit` is called.
  @override
  void dispose();

/*   /// Called when the top route has been popped off, and the current route
  /// shows up.
  void routingDidPopNext() {}

  /// Called when the current route has been pushed.
  void routingDidPush() {}

  /// Called when the current route has been popped off.
  void routingDidPop() {}

  /// Called when a new route has been pushed, and the current route is no
  /// longer visible.
  void routingDidPushNext() {} */

  // Called when user navigates back into the app
  void onResume() {}

  // Called when user navigates from the app
  void onPause() {}

  // Called when the app becomes inactive
  void onInactive() {}
}
