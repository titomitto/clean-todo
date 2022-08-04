import 'dart:developer';

import 'package:clean_todo/core/presentation/screens/screen.dart';
import 'package:clean_todo/core/presentation/view_models/app_view_model.dart';
import 'package:clean_todo/core/presentation/view_models/view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../config/providers.dart';
import 'view.dart';

class App extends View<AppViewModel> {
  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log("CHeck_11");
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        home: Scaffold(
          body: Center(
            child: Selector<AppViewModel, int>(
                selector: (_, viewModel) => viewModel.hello,
                builder: (context, hello, _) {
                  log("CHeck_");
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Sample ${viewModel.hii} Hit $hello, Joo ${viewModel.hello}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      MaterialButton(
                        onPressed: viewModel.decrement,
                        child: Text("Decrte"),
                      )
                    ],
                  );
                }),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: viewModel.increment,
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement name
  String get name => throw UnimplementedError();
}
