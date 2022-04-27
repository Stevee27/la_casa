import 'package:flutter/material.dart';

import '../models/MenuItem.dart';
import '../models/Option.dart';

class MenuOptions extends StatelessWidget {
  final MenuItem menuItem;
  final List<Option> options;

  const MenuOptions({Key? key, required this.menuItem, required this.options}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (options.isNotEmpty) {
      List<Widget> optionNames = options
          .map(
            (o) => CheckboxListTile(
                contentPadding: EdgeInsets.zero,
                controlAffinity: ListTileControlAffinity.leading,
                title: Text(o.name!, style: const TextStyle(color: Colors.pink, fontSize: 16)),
                value: true,
                onChanged: (newValue) => newValue = false),
          )
          .toList();
      // .map((o) => Text(o.name!, style: const TextStyle(color: Colors.pink, fontSize: 1))
      return ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: options.length,
        itemBuilder: (context, index) {
          return SizedBox(height: 30, child: optionNames[index]);
        },
      );
    }
    return Container();
  }
}
