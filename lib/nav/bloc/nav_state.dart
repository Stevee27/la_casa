import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../models/MenuItem.dart';

class NavState extends Equatable {
  const NavState(this.dest, {this.menuItems = const [], this.itemID = ''});

  final ValueKey dest;
  final List<MenuItem> menuItems;
  final String itemID;

  NavState copyWith({
    required ValueKey dest,
    List<MenuItem>? menuItems,
    String? itemID,
  }) {
    return NavState(
      dest,
      menuItems: menuItems ?? this.menuItems,
      itemID: itemID ?? this.itemID,
    );
  }

  @override
  List<Object?> get props => [dest, menuItems, itemID];
}
