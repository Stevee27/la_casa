import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_casa/menu/card_menu.dart';
import 'package:la_casa/models/MenuItem.dart';

import '../models/MenuType.dart';
import '../nav/nav_cubit.dart';

class MenuLayout extends StatelessWidget {
  final List<MenuItem> menuItems;
  final MenuType typeSelected;

  const MenuLayout({Key? key, required this.menuItems, this.typeSelected = MenuType.PIZZA})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<MenuItem> selectedMenuItems = menuItems.where((i) => i.menuType == typeSelected).toList();

    bool noName;
    switch (typeSelected) {
      case MenuType.SANDWICH:
      case MenuType.PASTRY:
      case MenuType.BEVERAGE:
        noName = true;
        break;
      default:
        noName = false;
    }

    String subtitle = 'BREAKFAST';
    if (typeSelected == MenuType.PASTRY) {
      subtitle = 'PASTRIES';
    } else if (typeSelected == MenuType.BEVERAGE) {
      subtitle = 'BEVERAGES';
    } else if (typeSelected == MenuType.SANDWICH) {
      subtitle = 'SANDWICHES';
    } else if (typeSelected == MenuType.PIZZA) {
      subtitle = 'PIZZA';
    } else if (typeSelected == MenuType.SALAD) {
      subtitle = 'SALAD';
    }

    return Scaffold(
        appBar: AppBar(
          // automaticallyImplyLeading: false,
          centerTitle: true,
          flexibleSpace: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      alignment: Alignment.bottomCenter,
                      image: AssetImage('assets/images/name.jpg'),
                      fit: BoxFit.fitWidth))),
          backgroundColor: Colors.white70,
        ),
        body: SizedBox.expand(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                CardMenu(
                  subtitle: subtitle,
                  menuItems: selectedMenuItems,
                  noName: noName,
                ),
                TextButton(
                  onPressed: () async {
                    BlocProvider.of<NavCubit>(context).showHome();
                  },
                  child: const Text('Home'),
                )
              ],
            ),
          ),
        ));
  }

  Widget _menuFilter() {
    return const Text('Filter widget');
  }
}
