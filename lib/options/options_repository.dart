import 'package:amplify_flutter/amplify_flutter.dart';

import '../models/Option.dart';

class OptionsRepository {
  Future<List<Option>> getOptions() async {
    try {
      List<Option> itemOptions = await Amplify.DataStore.query(Option.classType);
      return itemOptions;
    } catch (e) {
      throw e as Exception;
    }
  }

  // Future<List<Option>> getOptionsForMenuItemOLD(MenuItem item) async {
  //   try {
  //     List<MenuItemOption> itemOptions =
  //         await Amplify.DataStore.query(MenuItemOption.classType, where: MenuItemOption.MENUITEM.eq(item.id));
  //     var options = itemOptions.map((e) => e.option).toList();
  //     return options;
  //   } catch (e) {
  //     throw e as Exception;
  //   }
  // }
}
