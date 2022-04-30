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
    String currentSelectedID = '';
    List<MenuItem> menuItems = [];

    onSwipeRight(BuildContext context) {
      if (currentItemIndex < menuItems.length - 1) {
        currentItemIndex++;
        BlocProvider.of<OptionsCubit>(context)
            .clearOptionsForMenuItem(menuItems[currentItemIndex].id);
        BlocProvider.of<NavCubit>(context).showMenuItem(menuItems, menuItems[currentItemIndex].id);
      }
    }

    onSwipeLeft(BuildContext context) {
      if (currentItemIndex > 0) {
        currentItemIndex--;
        BlocProvider.of<OptionsCubit>(context)
            .clearOptionsForMenuItem(menuItems[currentItemIndex].id);
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
          body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: BlocBuilder<NavCubit, NavState>(builder: ((context, state) {
                menuItems = state.menuItems;
                currentItemIndex = menuItems.indexWhere((e) => e.id == state.itemID);
                if (currentItemIndex < 0) {
                  throw Exception("Menu index error");
                }
                MenuItem menuItem = menuItems[currentItemIndex];
                currentSelectedID = menuItem.id;
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
                                                    fontSize: 16, fontWeight: FontWeight.w500)),
                                          if (menuItem.price!.isEmpty &&
                                              menuItem.smallPrice!.isNotEmpty)
                                            Text(
                                                'Price: \$${_calculateTotalPrice(context, menuItem.smallPrice)}',
                                                style: const TextStyle(
                                                    fontSize: 16, fontWeight: FontWeight.w500)),
                                          if (menuItem.smallPrice!.isNotEmpty &&
                                              menuItem.price!.isNotEmpty)
                                            Text(
                                                'Small: \$${_calculateTotalPrice(context, menuItem.smallPrice)} Large: \$${_calculateTotalPrice(context, menuItem.price)}',
                                                style: const TextStyle(
                                                    fontSize: 16, fontWeight: FontWeight.w500)),
                                        ],
                                      );
                                    },
                                  ),
                                ])),
                          ),
                          Expanded(
                            flex: 30,
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
                          Expanded(
                            flex: 4,
                            child: SizedBox(
                                width: double.infinity,
                                child: Card(
                                    elevation: 4,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 8),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          const Spacer(),
                                          OutlinedButton(
                                            style: TextButton.styleFrom(
                                              primary: Colors.white,
                                              backgroundColor: Colors.grey,
                                              textStyle: const TextStyle(fontSize: 14),
                                            ),
                                            onPressed: () {},
                                            child: const Text('Show Photo'),
                                          ),
                                          const Spacer(flex: 10),
                                          ElevatedButton(
                                            style: TextButton.styleFrom(
                                              primary: Colors.white,
                                              backgroundColor: Colors.grey,
                                              textStyle: const TextStyle(fontSize: 14),
                                            ),
                                            onPressed: () {
                                              BlocProvider.of<NavCubit>(context)
                                                  .showOrder(menuItems, menuItem.id);
                                            },
                                            child: const Text('Order'),
                                          ),
                                          const Spacer()
                                        ],
                                      ),
                                    ))),
                          ),
                        ]));
                  }
                  if (state.status == OptionStatus.selected) {
                    BlocProvider.of<OptionsCubit>(context).getOptionsForMenuItem(menuItem);
                    return Container();
                  } else {
                    return const CircularProgressIndicator();
                  }
                }));
              }))),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.local_restaurant),
                label: 'Menu',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add_shopping_cart),
                label: 'Add Order',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: 'My Order',
              ),
            ],
            currentIndex: 1,
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.amber[800],
            onTap: (i) async {
              switch (i) {
                case 0:
                  BlocProvider.of<NavCubit>(context).showHome();
                  break;
                case 1:
                  BlocProvider.of<NavCubit>(context).showMenu();
                  break;
                case 2:
                  BlocProvider.of<NavCubit>(context).showOrder(menuItems, currentSelectedID);
                  break;
              }
            },
          ),
        ));
  }

  String? _calculateTotalPrice(context, String? basePrice) {
    if (basePrice != null) {
      double optionsPrice = BlocProvider.of<OptionsCubit>(context).getOptionsPrice();
      return (double.parse(basePrice) + optionsPrice).toStringAsFixed(2);
    }
    return '';
  }
}
