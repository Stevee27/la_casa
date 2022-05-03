import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cart/cart_page.dart';
import '../home/home_page.dart';
import '../menu_item/menu_item_page.dart';
import '../menu/menu_page.dart';
import '../models/MenuItem.dart';
import '../order/order_page.dart';
import '../user/auth_view.dart';
import 'nav_state.dart';

class NavCubit extends Cubit<NavState> {
  final Set<ValueKey> destPages = <ValueKey>{};

  NavCubit() : super(const NavState(HomePage.valueKey)) {
    destPages.add(AuthView.valueKey);
  }

  showHome() {
    destPages.clear();
    destPages.add(HomePage.valueKey);
    // emit(const NavState(HomePage.valueKey));
    emit(state.copyWith(dest: HomePage.valueKey));
  }

  showMenu() {
    destPages.remove(MenuItemPage.valueKey);
    destPages.add(MenuPage.valueKey);
    // emit(const NavState(MenuPage.valueKey));
    emit(state.copyWith(dest: MenuPage.valueKey));
  }

  showMenuItem(List<MenuItem> menuItems, String itemID) {
    destPages.add(MenuItemPage.valueKey);
    emit(state.copyWith(dest: MenuItemPage.valueKey, menuItems: menuItems, itemID: itemID));
  }

  showCart() {
    destPages.add(CartPage.valueKey);
    emit(state.copyWith(
      dest: CartPage.valueKey,
    ));
  }

  showOrder(menuItems, String itemID) {
    destPages.add(OrderPage.valueKey);
    emit(state.copyWith(dest: OrderPage.valueKey, menuItems: menuItems, itemID: itemID));
  }
}
