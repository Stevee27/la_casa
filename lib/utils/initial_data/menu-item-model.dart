// ignore_for_file: file_names

import '../../models/MenuType.dart';

class MenuItemModel {
  const MenuItemModel(this.legacy, this.name, this.menuType, this.description, this.smallPrice, this.price);

  final int legacy;
  final String name;
  final MenuType menuType;
  final String description;
  final String smallPrice;
  final String price;
}
