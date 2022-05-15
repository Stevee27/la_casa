import 'package:flutter/material.dart';
import 'package:la_casa/menu_item/pricer.dart';

import '../models/MenuItem.dart';

class SizeSelector extends StatelessWidget {
  final MenuItem menuItem;

  const SizeSelector({Key? key, required this.menuItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _character = ItemSize.small;
    if (menuItem.price!.isNotEmpty && menuItem.smallPrice!.isNotEmpty) {
      return SizedBox(
        height: 30,
        child: Row(children: [
          const Spacer(flex: 10),
          const Text('Small', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          Radio(
            groupValue: '123',
            value: ItemSize.small,
            onChanged: (value) {
              print(value);
            },
          ),
          const Spacer(flex: 1),
          const Text('Large', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          Radio(
            groupValue: '123',
            value: ItemSize.large,
            onChanged: (value) {
              print(value);
            },
          ),
        ]),
      );
    }
    return Container();
  }
}
