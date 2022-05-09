import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/order_bloc.dart';

class OrderPage extends StatelessWidget {
  static const valueKey = ValueKey<String>("OrderPage");
  const OrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderCubit, OrderState>(builder: ((context, state) {
      if (state.status == OrderStatus.initial) {
        return const Center(child: Text('Order Page Initial...'));
      } else if (state.status == OrderStatus.success) {
        return const Center(child: Text('Order Page Success...'));
      } else {
        return const Center(child: Text('Order Page Other...'));
      }
    }));
  }
}
