import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/order_bloc.dart';

class OrderPage extends StatelessWidget {
  static const valueKey = ValueKey<String>("OrderPage");
  const OrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // automaticallyImplyLeading: false,
          centerTitle: true,
          flexibleSpace: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      alignment: Alignment.bottomCenter,
                      image: AssetImage('assets/images/name.jpg'),
                      fit: BoxFit.fitWidth))),
          backgroundColor: Colors.white70,
        ),
        body: BlocProvider(
            create: (BuildContext context) => OrderCubit(),
            child: BlocBuilder<OrderCubit, OrderState>(builder: ((context, state) {
              if (state.status == OrderStatus.success) {
                return Container();
              } else {
                return const Center(child: Text('You cannot order yet.'));
              }
            }))));
  }
}
