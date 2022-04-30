import 'package:flutter_bloc/flutter_bloc.dart';

enum CartStatus { initial, success, error, loading, selected }

extension CartStatusX on CartStatus {
  bool get isInitial => this == CartStatus.initial;
  bool get isSuccess => this == CartStatus.success;
  bool get isError => this == CartStatus.error;
  bool get isLoading => this == CartStatus.loading;
  bool get isSelected => this == CartStatus.selected;
}

// ignore: must_be_immutable
class CartState {
  final CartStatus? status;

  CartState({this.status});

  CartState copyWith({
    CartStatus? status,
  }) {
    return CartState(
      status: status ?? this.status,
    );
  }
}

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState(status: CartStatus.initial));

  void showCart() {}
}
