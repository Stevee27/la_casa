import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_casa/menu_item/pricer.dart';
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
  settingCartItem,
  sizing,
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

class CartItem extends Equatable {
  final id = const Uuid().v1();
  final MenuItem menuItem;
  List<Option> options;
  final int quantity;
  String price;
  late ItemSize? selectedSize;

  CartItem({
    required this.menuItem,
    this.options = const [],
    this.quantity = 1,
    this.price = '',
    this.selectedSize,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [menuItem, options, selectedSize];
}

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState(status: CartStatus.initial));

  void checkForCartItem(MenuItem menuItem) async {
    if (state.reloadedCartItem == null) {
      CartItem item = await createInitialCartItem(menuItem);
      emit(state.copyWith(status: CartStatus.settingCartItem, reloadedCartItem: item));
    }
  }

  void addItem(menuItem, selectedOptions, price, selectedSize) {
    CartItem item = state.reloadedCartItem!;
    item.options = selectedOptions;
    item.price = price;
    // CartItem(menuItem: menuItem, options: selectedOptions, price: price, selectedSize: selectedSize);
    List<CartItem> changedItems = List.from(state.items);
    changedItems.add(item);
    emit(state.copyWith(
      status: CartStatus.adding,
      items: changedItems,
    ));
  }

  void editItem(CartItem? cartItem, List<Option>? options, String price, selectedSize) {
    if (cartItem != null && options != null) {
      var index = state.items.indexWhere((element) => element.id == cartItem.id);
      // var edittedItem = state.items.firstWhere((element) => element.id == cartItem!.id);
      List<CartItem> edittedCartList = List.from(state.items);
      edittedCartList[index].options = options;
      edittedCartList[index].price = price;
      edittedCartList[index].selectedSize = selectedSize;
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

  Future<CartItem> createInitialCartItem(MenuItem menuItem) async {
    ItemSize selectedSize = menuItem.price!.isNotEmpty ? ItemSize.large : ItemSize.small;
    CartItem item = CartItem(menuItem: menuItem, selectedSize: selectedSize);
    return item;
  }

  void showCart() {
    if (state.status == CartStatus.initial) {
      emit(state.copyWith(status: CartStatus.success));
    }
  }

  void selectSize(ItemSize itemSize) {
    state.reloadedCartItem!.selectedSize = itemSize;
    emit(state.copyWith(status: CartStatus.sizing, reloadedCartItem: state.reloadedCartItem!));
  }

  void sizingDone() {
    emit(state.copyWith(status: CartStatus.success));
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
