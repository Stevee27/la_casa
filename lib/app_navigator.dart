import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_casa/user/auth_view.dart';

import 'cart/cart_page.dart';
import 'home/home_page.dart';
import 'menu_item/menu_item_page.dart';
import 'menu/menu_page.dart';
import 'nav/nav_cubit.dart';
import 'nav/nav_state.dart';
import 'order/order_page.dart';
import 'user/auth_view.dart';

class AppNavigator extends StatelessWidget {
  AppNavigator({Key? key}) : super(key: key);

  final Set<ValueKey> destPages2 = <ValueKey>{};

  @override
  Widget build(BuildContext context) {
    Set<ValueKey> destPages = BlocProvider.of<NavCubit>(context).destPages;
    return BlocBuilder<NavCubit, NavState>(builder: ((context, state) {
      return Navigator(
          pages: [
            const MaterialPage(child: AuthView(), key: AuthView.valueKey),
            if (destPages.contains(HomePage.valueKey))
              const MaterialPage(child: HomePage(), key: HomePage.valueKey),
            if (destPages.contains(MenuPage.valueKey))
              const MaterialPage(child: MenuPage(), key: MenuPage.valueKey),
            if (destPages.contains(MenuItemPage.valueKey))
              const MaterialPage(child: MenuItemPage(), key: MenuItemPage.valueKey),
            if (destPages.contains(CartPage.valueKey))
              const MaterialPage(child: CartPage(), key: CartPage.valueKey),
          ],
          onPopPage: (route, result) {
            final page = route.settings as MaterialPage;
            if (page.key == CartPage.valueKey) {
              BlocProvider.of<NavCubit>(context).showMenu();
            } else if (page.key == MenuPage.valueKey) {
              BlocProvider.of<NavCubit>(context).showHome();
            }
            return route.didPop(result);
          });
    }));
  }
}
