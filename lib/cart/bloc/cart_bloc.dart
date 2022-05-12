import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import '../../models/MenuItem.dart';
import '../../models/Option.dart';

enum CartStatus { initial, success, error, loading, selected, adding, reloadingOptionsForItem, editting }

extension CartStatusX on CartStatus {
  bool get isInitial => this == CartStatus.initial;
  bool get isSuccess => this == CartStatus.success;
  bool get isError => this == CartStatus.error;
  bool get isLoading => this == CartStatus.loading;
  bool get isSelected => this == CartStatus.selected;
}

// ignore: must_be_immutable
class CartState extends Equatable {
  final CartStatus? status;
  List<CartItem> items;
  CartItem? reloadedCartItem;

  CartState({this.status, this.items = const [], this.reloadedCartItem});

  CartState copyWith({CartStatus? status, List<CartItem>? items, CartItem? reloadedCartItem}) {
    return CartState(
      status: status ?? this.status,
      items: items ?? this.items,
      reloadedCartItem: reloadedCartItem ?? this.reloadedCartItem,
    );
  }

  @override
  List<Object?> get props => [status, items, reloadedCartItem];
}

class CartItem {
  final id = const Uuid().v1;
  final MenuItem menuItem;
  final List<Option> options;
  final int quantity;

  CartItem({required this.menuItem, this.options = const [], this.quantity = 1});
}

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState(status: CartStatus.initial));

  void addItem(menuItem, selectedOptions) {
    CartItem item = CartItem(menuItem: menuItem, options: selectedOptions);
    List<CartItem> changedItems = List.from(state.items);
    changedItems.add(item);
    emit(state.copyWith(
      status: CartStatus.adding,
      items: changedItems,
    ));
  }

  void reloadMenuItemOptions(CartItem cartItem) {
    emit(state.copyWith(
      status: CartStatus.reloadingOptionsForItem,
      reloadedCartItem: cartItem,
    ));
  }

  void menuItemOptionsReloaded() {
    emit(state.copyWith(status: CartStatus.editting));
  }

  void itemAdded() {
    emit(state.copyWith(status: CartStatus.success));
  }

  void showCart() {
    if (state.status == CartStatus.initial) {
      emit(state.copyWith(status: CartStatus.success));
    }
  }
}
