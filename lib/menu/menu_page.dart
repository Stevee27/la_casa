import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  static const valueKey = ValueKey<String>("MenuPage");
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('MenuPage'),
    );
  }
}
