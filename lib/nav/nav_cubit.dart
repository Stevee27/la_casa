import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../home/home_page.dart';
import '../menu/menu_item_page.dart';
import '../menu/menu_page.dart';
import '../models/MenuItem.dart';
import 'nav_state.dart';

class NavCubit extends Cubit<NavState> {
  final Set<ValueKey> destPages = <ValueKey>{};

  NavCubit() : super(const NavState(HomePage.valueKey)) {
    destPages.add(HomePage.valueKey);
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
}