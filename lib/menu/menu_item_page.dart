import 'package:flutter/material.dart';

class MenuItemPage extends StatelessWidget {
  static const valueKey = ValueKey<String>("MenuItemPage");
  const MenuItemPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('MenuItemPage'),
    );
  }
}
