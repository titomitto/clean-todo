import 'package:clean_todo/core/presentation/screens/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class TodosScreen extends Screen {
  TodosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  String get routeName => "/todos";
}
