// ignore_for_file: empty_catches

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_casa/menu_item/pricer.dart';
import 'package:la_casa/options/bloc/menu_options_bloc.dart';

import '../cart/bloc/cart_bloc.dart';
import '../models/MenuItem.dart';
import '../models/Option.dart';
import '../nav/nav_bar.dart';
import '../nav/bloc/nav_cubit.dart';
import '../nav/bloc/nav_state.dart';
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
        BlocProvider.of<OptionsCubit>(context).clearOptionsForMenuItem();
        BlocProvider.of<NavCubit>(context).showMenuItem(menuItems, menuItems[currentItemIndex].id);
      }
    }

    onSwipeLeft(BuildContext context) {
      if (currentItemIndex > 0) {
        currentItemIndex--;
        BlocProvider.of<OptionsCubit>(context).clearOptionsForMenuItem();
        BlocProvider.of<NavCubit>(context).showMenuItem(menuItems, menuItems[currentItemIndex].id);
      }
    }

    return MultiBlocProvider(
        providers: [
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
            body: BlocListener<CartCubit, CartState>(
              listenWhen: (previous, current) {
                if (previous.status == CartStatus.editted || previous.status == CartStatus.removing) {
                  return false;
                }
                return true;
              },
              listener: (context, state) {
                if (state.status == CartStatus.adding) {
                  Scaffold.of(context).showSnackBar(const SnackBar(
                    backgroundColor: Colors.pink,
                    content: Text('Item placed on cart'),
                  ));
                  Future.delayed(const Duration(milliseconds: 1000))
                      .then((value) => BlocProvider.of<CartCubit>(context).itemAdded());
                  // .then((value) => BlocProvider.of<NavCubit>(context).showMenu());
                } else if (state.status == CartStatus.reloadingOptionsForItem) {
                  BlocProvider.of<OptionsCubit>(context).reloadSelected(state.reloadedCartItem!);
                  BlocProvider.of<CartCubit>(context).menuItemOptionsReloaded();
                  print("RELOADING OPTIONS FOR ITEM");
                } else if (state.status == CartStatus.success) {
                  BlocProvider.of<NavCubit>(context).showMenu();
                } else if (state.status == CartStatus.editted) {
                  BlocProvider.of<CartCubit>(context).editDone();
                  BlocProvider.of<NavCubit>(context).showCart();
                }
              },
              child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: BlocBuilder<NavCubit, NavState>(builder: (context, state) {
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
                                            style:
                                                const TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                                      if (menuItem.name!.isNotEmpty) const SizedBox(height: 25),
                                      Text(menuItem.description!,
                                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                                      const SizedBox(height: 20),
                                      // Builder(
                                      // builder: (BuildContext context) {
                                      Row(
                                        children: [
                                          const Spacer(),
                                          Pricer.priceWidget(context, menuItem),
                                        ],
                                      )
                                      // },
                                      // ),
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
                                              ElevatedButton(
                                                style: TextButton.styleFrom(
                                                  primary: ColorScheme.fromSwatch().primary,
                                                  backgroundColor: Colors.white,
                                                  textStyle: const TextStyle(fontSize: 14),
                                                ),
                                                onPressed: () {},
                                                child: const Text('Show Photo'),
                                              ),
                                              const Spacer(flex: 10),
                                              ElevatedButton(
                                                style: TextButton.styleFrom(
                                                  primary: ColorScheme.fromSwatch().primary,
                                                  backgroundColor: Colors.white,
                                                  textStyle: const TextStyle(fontSize: 14),
                                                ),
                                                onPressed: () {
                                                  List<Option> selectedOptions =
                                                      BlocProvider.of<OptionsCubit>(context)
                                                          .getSelectedOptions();
                                                  var cartStatus =
                                                      BlocProvider.of<CartCubit>(context).state.status;

                                                  var price = Pricer.priceString(context, menuItem);
                                                  if (cartStatus == CartStatus.editting) {
                                                    BlocProvider.of<CartCubit>(context).editItem(
                                                        BlocProvider.of<CartCubit>(context)
                                                            .state
                                                            .reloadedCartItem,
                                                        selectedOptions,
                                                        price);
                                                  } else {
                                                    BlocProvider.of<CartCubit>(context)
                                                        .addItem(menuItem, selectedOptions, price);
                                                  }
                                                  BlocProvider.of<OptionsCubit>(context)
                                                      .clearOptionsForMenuItem();
                                                },
                                                child: const Text('Save to Cart'),
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
                  })),
              // bottomNavigationBar:
            ),
            bottomNavigationBar: const NavBar(1)));
  }

  String _calculateTotalPrice(context, String? basePrice) {
    if (basePrice != null) {
      double optionsPrice = BlocProvider.of<OptionsCubit>(context).getOptionsPrice();
      double price = 0.0;
      try {
        price = double.parse(basePrice);
      } catch (e) {
        return ("");
      }
      return (price + optionsPrice).toStringAsFixed(2);
    }
    return '';
  }

  Widget _renderMultiPriceLine(context, MenuItem menuItem) {
    String smallPrice = _calculateTotalPrice(context, menuItem.smallPrice);
    String smallPriceString = smallPrice.isNotEmpty ? 'Small: \$$smallPrice' : '';
    String largePrice = _calculateTotalPrice(context, menuItem.price);
    String largePriceString = largePrice.isNotEmpty ? 'Large: \$$largePrice' : '';
    return Text(smallPriceString + largePriceString,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500));
  }
}
