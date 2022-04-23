import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const valueKey = ValueKey<String>("HomePage");

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Text('I am home'),
    ));
  }
}
