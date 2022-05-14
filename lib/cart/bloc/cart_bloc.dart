import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import '../../models/MenuItem.dart';
import '../../models/Option.dart';

enum CartStatus {
  initial,
  success,
  error,
  loading,
  selected,
  adding,
  reloadingOptionsForItem,
  editting,
  editted,
  removing,
  clearall,
}

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
  final id = const Uuid().v1();
  final MenuItem menuItem;
  List<Option> options;
  final int quantity;
  String price;

  CartItem({required this.menuItem, this.options = const [], this.quantity = 1, this.price = ''});
}

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState(status: CartStatus.initial));

  void addItem(menuItem, selectedOptions, price) {
    CartItem item = CartItem(menuItem: menuItem, options: selectedOptions, price: price);
    List<CartItem> changedItems = List.from(state.items);
    changedItems.add(item);
    emit(state.copyWith(
      status: CartStatus.adding,
      items: changedItems,
    ));
  }

  void editItem(CartItem? cartItem, List<Option>? options, String price) {
    if (cartItem != null && options != null) {
      var index = state.items.indexWhere((element) => element.id == cartItem.id);
      // var edittedItem = state.items.firstWhere((element) => element.id == cartItem!.id);
      List<CartItem> edittedCartList = List.from(state.items);
      edittedCartList[index].options = options;
      edittedCartList[index].price = price;
      // edittedCartList[index].options = options;
      emit(state.copyWith(status: CartStatus.editted, items: edittedCartList));
    }
  }

  void removeItem(CartItem cartItem) {
    emit(state.copyWith(status: CartStatus.removing));
    List<CartItem> edittedCartList = List.from(state.items);
    edittedCartList.remove(cartItem);
    emit(state.copyWith(status: CartStatus.success, items: edittedCartList));
  }

  void editDone() {
    emit(state.copyWith(status: CartStatus.success));
  }

  void reloadMenuItemOptions(CartItem cartItem) {
    // var allOptions = cartItem.menuItem.Options;

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

  void clearAll() {
    emit(state.copyWith(
      status: CartStatus.clearall,
      items: [],
    ));
  }

  void allCleared() {
    emit(state.copyWith(status: CartStatus.success));
  }
}
