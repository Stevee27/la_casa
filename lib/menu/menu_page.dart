import 'package:flutter/material.dart';
import 'package:la_casa/menu/menu_layout.dart';

class MenuPage extends StatelessWidget {
  static const valueKey = ValueKey<String>("MenuPage");
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MenuLayout();
  }
}
