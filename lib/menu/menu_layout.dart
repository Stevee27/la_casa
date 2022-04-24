import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_casa/menu/bloc/menu_select_bloc.dart';
import 'package:la_casa/menu/card_menu.dart';
import 'package:la_casa/menu/menu_toggles.dart';
import 'package:la_casa/models/MenuItem.dart';

import '../models/MenuType.dart';
import '../nav/nav_cubit.dart';

class MenuLayout extends StatelessWidget {
  final List<MenuItem> menuItems;

  const MenuLayout({Key? key, required this.menuItems}) : super(key: key);

  @override
  Widget build(context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          flexibleSpace: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      alignment: Alignment.bottomCenter,
                      image: AssetImage('assets/images/name.jpg'),
                      fit: BoxFit.fitWidth))),
          backgroundColor: Colors.white70,
        ),
        body: BlocProvider(
          create: (BuildContext context) => MenuSelectCubit(),
          child: BlocBuilder<MenuSelectCubit, MenuSelectState>(builder: ((context, state) {
            if (state is MenuSelectSuccess) {
              List<MenuItem> selectedMenuItems =
                  menuItems.where((i) => i.menuType == state.selected).toList();
              return SizedBox.expand(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Column(children: [
                        const MenuToggles(),
                        CardMenu(
                          subtitle: _getSubtitle(state.selected),
                          menuItems: selectedMenuItems,
                          hasName: _hasName(state.selected),
                        ),
                        TextButton(
                          onPressed: () async {
                            BlocProvider.of<NavCubit>(context).showHome();
                          },
                          child: const Text('Home'),
                        )
                      ])));
            } else {
              return Container();
            }
          })),
        ));
  }

  _getSubtitle(MenuType selected) {
    switch (selected) {
      case MenuType.BREAKFAST:
        return 'BREAKFAST';
      case MenuType.PASTRY:
        return 'PASTRIES';
      case MenuType.BEVERAGE:
        return 'BEVERAGES';
      case MenuType.SANDWICH:
        return 'SANDWICH';
      case MenuType.PIZZA:
        return 'PIZZA';
      case MenuType.SALAD:
        return 'SALAD';
    }
  }

  _hasName(MenuType selected) {
    switch (selected) {
      case MenuType.SANDWICH:
      case MenuType.PASTRY:
      case MenuType.BEVERAGE:
        return false;
      default:
        return true;
    }
  }

  Widget _menuFilter() {
    return const Text('Filter widget');
  }
}
