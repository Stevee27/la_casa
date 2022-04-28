import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_casa/options/bloc/menu_options_bloc.dart';

import '../models/MenuItem.dart';
import '../nav/nav_cubit.dart';
import '../nav/nav_state.dart';
import '../options/menu_options_widget.dart';
import 'bloc/menu_item_bloc.dart';

class MenuItemPage extends StatelessWidget {
  static const valueKey = ValueKey<String>("MenuItemPage");

  const MenuItemPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int currentItemIndex = 0;
    List<MenuItem> menuItems = [];

    onSwipeRight(BuildContext context) {
      if (currentItemIndex < menuItems.length - 1) {
        currentItemIndex++;
        BlocProvider.of<NavCubit>(context).showMenuItem(menuItems, menuItems[currentItemIndex].id);
      }
    }

    onSwipeLeft(BuildContext context) {
      if (currentItemIndex > 0) {
        currentItemIndex--;
        BlocProvider.of<NavCubit>(context).showMenuItem(menuItems, menuItems[currentItemIndex].id);
      }
    }

    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => OptionsCubit()),
          BlocProvider(create: (context) => MenuItemCubit()),
        ],
        child: Scaffold(
            appBar: AppBar(
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
                    child: BlocBuilder<NavCubit, NavState>(builder: ((context, state) {
                      menuItems = state.menuItems;
                      currentItemIndex = menuItems.indexWhere((e) => e.id == state.itemID);
                      if (currentItemIndex < 0) {
                        throw Exception("Menu index error");
                      }
                      MenuItem menuItem = menuItems[currentItemIndex];
                      BlocProvider.of<OptionsCubit>(context).getOptionsForMenuItem(menuItem);
                      return BlocBuilder<OptionsCubit, OptionsState>(builder: ((context, state) {
                        if (state.status == OptionStatus.success) {
                          return GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onHorizontalDragEnd: (details) {
                                if (details.primaryVelocity! > 0) {
                                  onSwipeLeft(context);
                                } else if (details.primaryVelocity! < 0) {
                                  onSwipeRight(context);
                                }
                              },
                              child: Column(children: [
                                Card(
                                  elevation: 4,
                                  child: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Column(children: [
                                        if (menuItem.name!.isNotEmpty)
                                          Text(menuItem.name!,
                                              style: const TextStyle(
                                                  fontSize: 20, fontWeight: FontWeight.w700)),
                                        if (menuItem.name!.isNotEmpty) const SizedBox(height: 25),
                                        Text(menuItem.description!,
                                            style: const TextStyle(
                                                fontSize: 18, fontWeight: FontWeight.w500)),
                                        const SizedBox(height: 20),
                                        Builder(
                                          builder: (BuildContext context) {
                                            return Row(
                                              children: [
                                                const Spacer(),
                                                if (menuItem.smallPrice!.isEmpty &&
                                                    menuItem.price!.isNotEmpty)
                                                  Text(
                                                      'Price: \$${_calculateTotalPrice(context, menuItem.price)}',
                                                      style: const TextStyle(
                                                          fontSize: 16,
                                                          fontWeight: FontWeight.w500)),
                                                if (menuItem.price!.isEmpty &&
                                                    menuItem.smallPrice!.isNotEmpty)
                                                  Text(
                                                      'Price: \$${_calculateTotalPrice(context, menuItem.smallPrice)}',
                                                      style: const TextStyle(
                                                          fontSize: 16,
                                                          fontWeight: FontWeight.w500)),
                                                if (menuItem.smallPrice!.isNotEmpty &&
                                                    menuItem.price!.isNotEmpty)
                                                  Text(
                                                      'Small: \$${_calculateTotalPrice(context, menuItem.smallPrice)}  Large: \$${_calculateTotalPrice(context, menuItem.price)}',
                                                      style: const TextStyle(
                                                          fontSize: 16,
                                                          fontWeight: FontWeight.w500)),
                                              ],
                                            );
                                          },
                                        ),
                                      ])),
                                ),
                                SizedBox(
                                  height: 300,
                                  child: Card(
                                    elevation: 4,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                                      child: MenuOptions(
                                        menuItem: menuItem,
                                        options: state.options!,
                                      ),
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                const Text('Buttons')
                              ]));
                        }
                        if (state.status == OptionStatus.selected) {
                          BlocProvider.of<OptionsCubit>(context).getOptionsForMenuItem(menuItem);
                          return Container();
                        } else {
                          return const CircularProgressIndicator();
                        }
                      }));
                    }))))));
  }

  String? _calculateTotalPrice(context, String? basePrice) {
    var aaa = BlocProvider.of<OptionsCubit>(context).getOptionsPrice();
    return basePrice;
  }
}
