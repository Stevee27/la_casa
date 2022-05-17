import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../cart/bloc/cart_bloc.dart';
import '../../models/MenuItem.dart';

class NavState extends Equatable {
  const NavState(this.dest, {this.currentCartItem, this.menuItems = const [], this.itemID = ''});

  final ValueKey dest;
  final List<MenuItem> menuItems;
  final String itemID;
  final CartItem? currentCartItem;

  NavState copyWith({
    required ValueKey dest,
    List<MenuItem>? menuItems,
    String? itemID,
    CartItem? currentCartItem,
  }) {
    return NavState(
      dest,
      menuItems: menuItems ?? this.menuItems,
      itemID: itemID ?? this.itemID,
      currentCartItem: currentCartItem ?? this.currentCartItem,
    );
  }

  @override
  List<Object?> get props => [dest, menuItems, itemID, currentCartItem];
}
