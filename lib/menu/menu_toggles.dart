import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_casa/menu/bloc/menu_select_bloc.dart';

import '../models/MenuType.dart';

class MenuToggles extends StatelessWidget {
  const MenuToggles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> toggleNames = [];
    final List<bool> toggleSelection = [];
    for (var value in MenuType.values) {
      toggleNames.add(Padding(
        padding: const EdgeInsets.only(right: 2),
        child:
            Text(value.name, style: const TextStyle(fontSize: 12.5, fontWeight: FontWeight.w500)),
      ));
      toggleSelection.add(false);
    }
    toggleSelection[0] = true;
    return BlocBuilder<MenuSelectCubit, MenuSelectState>(builder: (context, state) {
      return SizedBox(
        height: 40,
        child: ToggleButtons(
          children: toggleNames,
          isSelected: toggleSelection,
          onPressed: (index) {
            for (int i = 0; i < toggleSelection.length; i++) {
              toggleSelection[i] = i == index;
            }
            BlocProvider.of<MenuSelectCubit>(context).menuSelect(MenuType.values[index]);
          },
          renderBorder: false,
          selectedColor: Colors.pink,
          fillColor: Colors.white38,
        ),
      );
    });
  }
}
