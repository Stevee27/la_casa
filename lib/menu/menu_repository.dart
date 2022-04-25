// ignore_for_file: use_rethrow_when_possible

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:la_casa/models/ModelProvider.dart';

class MenuRepository {
  Future<List<MenuItem>> getMenuItems() async {
    try {
      final menuItems = await Amplify.DataStore.query(MenuItem.classType);
      return menuItems;
    } catch (e) {
      throw e;
    }
  }

  Future<void> createMenuItem(MenuItem menuItem) async {
    try {
      await Amplify.DataStore.save(menuItem);
    } catch (e) {
      throw e;
    }
  }

  Future<void> updateMenuItem(MenuItem menuItem) async {
    try {
      await Amplify.DataStore.save(menuItem);
    } catch (e) {
      throw e;
    }
  }

  Future<List<Option>> getOptions() async {
    try {
      final options = await Amplify.DataStore.query(Option.classType);
      return options;
    } catch (e) {
      throw e;
    }
  }

  Future<void> createOption(Option option) async {
    try {
      await Amplify.DataStore.save(option);
    } catch (e) {
      throw e;
    }
  }

  Future<List<MenuItemOption>> getItemOptions() async {
    try {
      List<MenuItemOption> itemOptions = await Amplify.DataStore.query(MenuItemOption.classType);
      return itemOptions;
    } catch (e) {
      throw e;
    }
  }

  Future<void> addAllOptionsToMenuItem(List<Option> options, MenuItem menuItem) async {
    try {
      for (Option option in options) {
        final itemOption = MenuItemOption(option: option, menuItem: menuItem);
        await Amplify.DataStore.save(itemOption);
      }
    } catch (e) {
      throw e;
    }
  }
}
