import 'package:flutter/material.dart';

import '../models/MenuItem.dart';
import '../models/Option.dart';

class MenuOptions extends StatelessWidget {
  final MenuItem menuItem;
  final List<Option> options;

  const MenuOptions({Key? key, required this.menuItem, required this.options}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // MenuRepository repo = MenuRepository();
    // var options = repo.getOptionsForMenuItem(menuItem);
    if (options.isNotEmpty) {
      List<Widget> optionNames = options.map((o) => Text(o.name!)).toList();
      var isSelected = <bool>[];
      for (int i = 0; i < optionNames.length; i++) {
        isSelected.add(false);
      }
      return GridView.builder(
        itemCount: options.length,
        itemBuilder: (context, index) {
          return optionNames[index];
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      );
      // return Wrap(children: [...optionNames]);
    }
    return Container();
  }
}
