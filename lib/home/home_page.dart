import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_casa/casa_error_widget.dart';
import 'package:la_casa/home/bloc/store_hours_bloc.dart';
import 'package:la_casa/home/home_layout.dart';
import 'package:la_casa/home/home_repository.dart';
import 'package:la_casa/loading_view.dart';
import 'package:la_casa/menu/menu_repository.dart';
import 'package:la_casa/utils/menu-items.dart';

import '../models/MenuItem.dart';
import '../utils/menu-item-model.dart';

class HomePage extends StatelessWidget {
  static const valueKey = ValueKey<String>("HomePage");

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    precacheImage(const AssetImage("assets/images/curbview.jpg"), context);
    precacheImage(const AssetImage("assets/images/name.jpg"), context);
    return BlocBuilder<StoreHoursCubit, StoreHoursState>(builder: (context, state) {
      if (state is StoreHoursSuccess) {
        if (state.storeHours.isEmpty) {
          BlocProvider.of<StoreHoursCubit>(context).creatStoreHours(intialStoreHoursArray);
          return Container();
        } else {
          _createInitialMenuItemsFromOldModels(initialMenuModelArray);
          return HomeLayout(storeHours: state.storeHours);
        }
      } else if (state is StoreHoursFailure) {
        return CasaErrorWidget(exception: state.exception);
      } else {
        return const LoadingView();
      }
    });
  }

  List<MenuItem> _convertMenuItems(List<MenuItemModel> list) {
    final List<MenuItem> menuitems = [];
    for (MenuItemModel item in list) {
      menuitems.add(MenuItem(
          name: item.name,
          description: item.description,
          price: item.price,
          smallPrice: item.smallPrice,
          menuType: item.menuType));
    }
    return menuitems;
  }

  _createInitialMenuItemsFromOldModels(List<MenuItemModel> list) async {
    final MenuRepository repo = MenuRepository();
    try {
      List<MenuItem> checkList = await repo.getMenuItems();
      if (checkList.isEmpty) {
        List<MenuItem> menuItems = _convertMenuItems(list);
        for (MenuItem menuItem in menuItems) {
          repo.createMenuItem(menuItem);
        }
      }
    } catch (e) {
      // ignore: use_rethrow_when_possible
      throw e;
    }
  }
}
