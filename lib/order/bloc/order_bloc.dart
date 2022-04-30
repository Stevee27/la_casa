import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/Order.dart';
import '../order_repository.dart';

enum OrderStatus { initial, success, error, loading, selected }

extension OrderStatusX on OrderStatus {
  bool get isInitial => this == OrderStatus.initial;
  bool get isSuccess => this == OrderStatus.success;
  bool get isError => this == OrderStatus.error;
  bool get isLoading => this == OrderStatus.loading;
  bool get isSelected => this == OrderStatus.selected;
}

// ignore: must_be_immutable
class OrderState extends Equatable {
  final OrderStatus? status;
  final List<Order>? options;

  OrderState({this.status, this.options});

  OrderState copyWith({
    OrderStatus? status,
    List<Order>? options,
    Set<String>? selectedOrders,
  }) {
    return OrderState(
      status: status ?? this.status,
      options: options ?? this.options,
    );
  }

  @override
  List<Object?> get props => [
        status,
        options,
      ];
}

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderState(status: OrderStatus.initial));

  final _orderRepository = OrderRepository();

  Order getCurrentOrder() {
    return null as Order;
  }

  void createOrder() {}

  List<Order> getOrdersForUser() {
    return null as List<Order>;
  }

  // void getOptionsForMenuItem(MenuItem menuItem) async {
  //   try {
  //     if (state.status == OptionStatus.initial) {
  //       state.selectedOptions = <String>{};
  //     }
  //     emit(state.copyWith(status: OptionStatus.loading));
  //     final options = await _optionsRepository.getOptionsForMenuItem(menuItem);

  //     emit(state.copyWith(status: OptionStatus.success, options: options));
  //   } catch (e) {
  //     emit(state.copyWith(status: OptionStatus.error));
  //   }
  // }
}
