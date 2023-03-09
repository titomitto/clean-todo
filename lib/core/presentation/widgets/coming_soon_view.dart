import 'package:flutter/material.dart';

class ComingSoonView extends StatelessWidget {
  const ComingSoonView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            "Coming soon",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text("This feature is still in development."),
        ],
      ),
    );
  }
}
