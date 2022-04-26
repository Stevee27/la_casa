import 'package:amplify_flutter/amplify_flutter.dart';

import '../models/MenuItem.dart';
import '../models/MenuItemOption.dart';
import '../models/Option.dart';

class OptionsRepository {
  Future<List<Option>> getOptionsForMenuItem(MenuItem item) async {
    try {
      List<MenuItemOption> itemOptions = await Amplify.DataStore.query(MenuItemOption.classType,
          where: MenuItemOption.MENUITEM.eq(item.id));
      var options = itemOptions.map((e) => e.option).toList();
      return options;
    } catch (e) {
      throw e as Exception;
    }
  }
}
