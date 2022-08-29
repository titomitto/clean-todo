import 'package:flutter/material.dart';

class StreamView<T> extends StatelessWidget {
  final T? initialData;
  final Stream<T> stream;
  final Widget Function(Object? error, StackTrace? stackTrace)? onError;
  final Widget Function(T? data) onSuccess;
  final Widget Function() onWaiting;

  const StreamView({
    Key? key,
    required this.stream,
    this.initialData,
    required this.onSuccess,
    this.onError,
    required this.onWaiting,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<T>(
      initialData: initialData,
      stream: stream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return onWaiting();
        } else if (snapshot.hasData) {
          return onSuccess(snapshot.data);
        } else {
          return const Text("UnCought!");
        }
      },
    );
  }
}
