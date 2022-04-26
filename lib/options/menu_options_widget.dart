import 'package:flutter/material.dart';

import '../models/MenuItem.dart';

class MenuOptions extends StatelessWidget {
  final MenuItem menuItem;

  const MenuOptions({Key? key, required this.menuItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // MenuRepository repo = MenuRepository();
    // var options = repo.getOptionsForMenuItem(menuItem);
    return const Text('WIDGET');
  }
}
