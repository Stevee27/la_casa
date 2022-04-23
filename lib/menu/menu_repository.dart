// ignore_for_file: use_rethrow_when_possible

import 'package:amplify_flutter/amplify_flutter.dart';

import '../models/MenuItem.dart';

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
}
